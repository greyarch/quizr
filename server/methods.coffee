Meteor.methods
  addQuiz: (doc) -> Quizes.insert doc
  updateQuiz: (doc) -> Quizes.update {_id: doc._id}, doc
  removeQuiz: (docId) -> Quizes.remove _id: docId
