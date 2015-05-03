Template.quiz.created = ->
  $('body').css('background-image', "url(#{Sessions.findOne().quiz?.image})") # a bit hacky way to set the background
  $('body').css('background-size', 'cover')

Template.quiz.rendered = ->
  $('.question-header').bigtext
    maxfontsize: 60
    minfontsize: 14

Template.quiz.helpers
  quiz: -> Sessions.findOne().quiz
  show: ->
    sess = Sessions.findOne()
    if sess && sess.result.currentQuestion > sess.quiz.questions.length
      Router.go 'result', sessId: sess._id
    else
      'hidden' unless sess.result.currentQuestion == @ord

Template.quiz.events
  'click button': (e, t) ->
    sess = Sessions.findOne()
    if @correct then sess.result.correctCount += 1
    sess.result.responses.push
      qord: sess.result.currentQuestion
      answer: @
    res = sess.result.percentage = Math.round(100 * sess.result.correctCount / sess.result.currentQuestion)
    sess.result.text = _.find(sess?.quiz.results, (result) -> result?.bottom <= res <= result?.top)?.text
    sess.result.currentQuestion += 1

    Meteor.call 'updateSession', sess
