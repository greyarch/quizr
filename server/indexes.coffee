Meteor.startup ->
  Quizzes._ensureIndex
    slug: 1
  Quizzes._ensureIndex
    published: 1
