Meteor.methods
  addQuiz: (doc) -> Quizzes.insert doc
  updateQuiz: (doc) -> Quizzes.update {_id: doc._id}, doc
  removeQuiz: (docId) -> Quizzes.remove _id: docId
