Template.quiz.created = ->
  Meteor.subscribe 'quiz', @data.quiz
  Session.setDefault('currentQuestion', 1)
  Session.setDefault('correctCount', 0)


Template.quiz.helpers
  quiz: -> Quizes.findOne {}, transform: (quiz) ->
    Session.set 'questionsCount', quiz.questions.length
    # $('body').css('background-image', "url(#{quiz.image})")
    # $('body').css('background-repeat', 'no-repeat')
    # $('body').css('background-size', 'cover')
    quiz

Template.question.events
  'click button': (e, t) ->
    console.log @
    if @correct then Session.set('correctCount', Session.get('correctCount') + 1)

    curQ = Session.get 'currentQuestion'
    if Session.equals('questionsCount', curQ)
      Router.go 'results'
    else
      Session.set 'currentQuestion', curQ + 1

Template.question.helpers
  show: (e, t) -> unless Session.equals('currentQuestion', @ord) then 'hidden'
