Meteor.startup ->
  Migrations.add
    version: 1
    up: ->
      Quizzes.find().forEach (q) ->
        isCompleted =
          'quiz.slug': q.slug
          'result.currentQuestion': q.questions.length + 1
        Sessions.update(isCompleted, {$set: 'result.completed': true}, {multi: true})
        console.log Sessions.find('result.completed': true).count()

  Migrations.migrateTo('latest')
