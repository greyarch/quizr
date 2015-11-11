Template.statistics.helpers
  quizzes: -> Quizzes.find(_id: $in: Meteor.user().assignedQuizzes)
  totalSessions: -> Sessions.find('quiz.slug': @slug).count()
  sharedSessions: -> Sessions.find('quiz.slug': @slug, 'result.shared': $exists: true).count()
  completedSessions: -> Sessions.find('quiz.slug': @slug, 'result.completed': true).count()
  showReport: -> 'admin' in Meteor.user().roles
