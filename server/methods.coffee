Meteor.methods
  addQuiz: (doc) -> Quizzes.insert doc
  updateQuiz: (doc) -> Quizzes.update {_id: doc._id}, doc
  removeQuiz: (docId) -> Quizzes.remove _id: docId

  sendMsg: (from, text) ->
    check([from, text], [String]);
    @unblock();

    Email.send
      to: "admin@quizzer.bg",
      from: from,
      subject: "Message from the website!",
      text: text

  updateSession: (doc) ->
    Sessions.update {_id: doc._id}, $set: _.omit(doc, '_id')

  saveShared: (sessId, destination) ->
    Sessions.update {_id: sessId},
      $addToSet:
        "result.shared": destination

  createSession: (quiz) ->
    quiz = Quizzes.findOne slug: quiz
    Sessions.insert
      quiz: quiz
      result:
        currentQuestion: 1
        correctCount: 0
        responses: []

  setFeatured: (id, featured) ->
    Quizzes.update {_id: id}, $set: featured: featured
  setAssignedQuizzes: (id, assigned) ->
    Meteor.users.update {_id: id}, {$set: assignedQuizzes: assigned}
