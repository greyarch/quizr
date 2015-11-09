Template.statistics.helpers
  quizzes: -> Quizzes.find()
  totalSessions: -> Sessions.find('quiz.slug': @slug).count()
  sharedSessions: -> Sessions.find('quiz.slug': @slug, 'result.shared': $exists: true).count()
  showReport: -> Roles.userIsInRole(Meteor.userId(), 'client')
