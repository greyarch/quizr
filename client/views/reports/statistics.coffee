userIs = (role) -> role in Meteor.user().roles

Template.statistics.helpers
  quizzes: ->
    if userIs('admin')
      Quizzes.find {}, sort: name: 1
    else
      Quizzes.find
        _id:
          $in: Meteor.user().assignedQuizzes
        sort:
          name: 1
  totalSessions: -> Sessions.find('quiz.slug': @slug).count()
  sharedSessions: -> Sessions.find('quiz.slug': @slug, 'result.shared': $exists: true).count()
  completedSessions: -> Sessions.find('quiz.slug': @slug, 'result.completed': true).count()
  showReport: -> userIs 'client'
