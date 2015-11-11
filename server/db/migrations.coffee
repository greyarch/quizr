Meteor.startup ->
  Migrations.add
    version: 1
    up: ->
      Quizzes.find().forEach (q) ->
        isCompleted =
          'quiz.slug': q.slug
          'result.currentQuestion': q.questions.length + 1
        Sessions.update(isCompleted, {$set: 'result.completed': true}, {multi: true})

  Migrations.migrateTo('latest')
