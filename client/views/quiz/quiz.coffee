Template.quiz.created = ->
  Session.set('currentQuestion', 0)
  Session.set('correctCount', 0)

Template.quiz.helpers
  quiz: ->
    quiz = Quizzes.findOne(slug: @quiz)
    $('body').css('background-image', "url(#{quiz?.image})") # a bit hacky way to set the background
    $('body').css('background-size', 'cover')
    Session.set 'questionsCount', quiz?.questions?.length
    quiz
  showStartPage: -> Session.equals 'currentQuestion', 0
  showResultsPage: -> Session.equals 'currentQuestion', 'results'

Template.quiz.destroyed = ->
    $('body').css 'background-image', '' # a bit hacky way to reset the background

Template.question.events
  'click button': (e, t) ->
    if @correct then Session.set('correctCount', Session.get('correctCount') + 1)
    curQ = Session.get 'currentQuestion'
    if Session.equals('questionsCount', curQ)
      Session.set 'currentQuestion', 'results'
    else
      Session.set 'currentQuestion', curQ + 1

Template.question.helpers
  show: (e, t) -> unless Session.equals('currentQuestion', @ord) then 'hidden'

Template.startPage.events
  'click #startButton': (e, t) -> Session.set('currentQuestion', 1)

Template.results.created = ->
  console.log @
  $('meta[property^="og:"]').remove()
  $('<meta>', { property: 'og:image', content: 'http://files.quizzer.bg/Shutta/cover.jpg' }).appendTo 'head'
  $('<meta>', { property: 'og:type', content: 'article' }).appendTo 'head'
  $('<meta>', { property: 'og:site_name', content: location.hostname }).appendTo 'head'
  $('<meta>', { property: 'og:url', content: location.origin + location.pathname }).appendTo 'head'
  $('<meta>', { property: 'og:title', content: "Quiiiiiizzzzer" }).appendTo 'head'
  $('<meta>', { property: 'og:description', content: 'This is description' }).appendTo 'head'

Template.results.helpers
  result: -> calculateResult()
  resultText: ->
    res = calculateResult()
    _.find(@results, (result) -> result?.bottom <= res <= result?.top)?.text
  # shareData: ->
  title: -> encodeURIComponent @name
  author: -> encodeURIComponent 'http://quizzer.bg'
  description: -> encodeURIComponent @description
  url:  -> encodeURIComponent(location.origin + location.pathname)
  # sitenap:  -> 'http://qzr.meteor.com'
  # thumbnail: -> 'http://files.quizzer.bg/Shutta/cover.jpg'
  image : -> encodeURIComponent 'http://files.quizzer.bg/Shutta/cover.jpg'


calculateResult = -> Math.round(100 * Session.get('correctCount') / Session.get('questionsCount'))
