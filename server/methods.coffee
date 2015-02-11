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
