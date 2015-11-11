userIs = (role) ->
  if typeof Meteor.user().roles is 'array'
    role in Meteor.user().roles
  else
    role in Meteor.user().roles?.__global_roles__

Template.statistics.helpers
  quizzes: ->
    if userIs('admin')
      Quizzes.find {}, sort: name: 1
    else
      assignedQuizzes = Meteor.user().assignedQuizzes or []
      Quizzes.find {_id: $in: assignedQuizzes}, {sort: name: 1}
  totalSessions: -> Sessions.find('quiz.slug': @slug).count()
  sharedSessions: -> Sessions.find('quiz.slug': @slug, 'result.shared': $exists: true).count()
  completedSessions: -> Sessions.find('quiz.slug': @slug, 'result.completed': true).count()
  showReport: -> userIs 'client'
