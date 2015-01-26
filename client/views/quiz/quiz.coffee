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

Template.results.helpers
  resultText: ->
    res = Math.round(100 * Session.get('correctCount') / Session.get('questionsCount'))
    resultRange = _.find(@results, (result) -> result?.bottom <= res <= result?.top)
    "Вие отговорихте вярно на #{res}% от въпросите. #{resultRange.text}"
