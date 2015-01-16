Template.quiz.created = ->
  Session.set('currentQuestion', 1)
  Session.set('correctCount', 0)

Template.quiz.rendered = ->
  Meteor.subscribe 'quiz', @data.quiz

Template.quiz.helpers
  quiz: ->
    quiz = Quizes.findOne(slug: @quiz)
    Session.set 'questionsCount', quiz?.questions?.length
    quiz

Template.question.events
  'click button': (e, t) ->
    if @correct then Session.set('correctCount', Session.get('correctCount') + 1)
    curQ = Session.get 'currentQuestion'
    if Session.equals('questionsCount', curQ)
      Router.go 'results'
    else
      Session.set 'currentQuestion', curQ + 1

Template.question.helpers
  show: (e, t) -> unless Session.equals('currentQuestion', @ord) then 'hidden'
