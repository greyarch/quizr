Template.quiz.created = ->
  $('body').css('background-image', "url(#{Sessions.findOne().quiz?.image})") # a bit hacky way to set the background
  $('body').css('background-size', 'cover')

Template.quiz.helpers
  quiz: -> Quizzes.findOne()
  show: ->
    sess = Sessions.findOne()
    quiz = Quizzes.findOne()
    if sess && sess.result.currentQuestion > quiz.questions.length
      Router.go 'result', sessId: sess._id
      Meteor.call 'markAsCompleted', sess._id
    else
      'hidden' unless sess.result.currentQuestion == @ord

Template.quiz.events
  'click button': (e, t) ->
    sess = Sessions.findOne()
    quiz = Quizzes.findOne()
    if @correct then sess.result.correctCount += 1
    sess.result.responses.push
      qord: sess.result.currentQuestion
      answer: @
    res = sess.result.percentage = Math.round(100 * sess.result.correctCount / sess.result.currentQuestion)
    sess.result.text = _.find(quiz.results, (result) -> result?.bottom <= res <= result?.top)?.text
    sess.result.currentQuestion += 1

    Meteor.call 'updateSession', sess
