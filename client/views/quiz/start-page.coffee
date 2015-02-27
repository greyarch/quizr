Template.startPage.helpers
  quiz: ->
    quiz = Quizzes.findOne(slug: @quiz)
    $('body').css('background-image', "url(#{quiz?.image})") # a bit hacky way to set the background
    $('body').css('background-size', 'cover')
    quiz

Template.startPage.destroyed = ->
    $('body').css 'background-image', '' # a bit hacky way to reset the background

Template.startPage.events
  'click #startButton': (e, t) ->
    Sessions.insert _.extend({quiz: @}, {result: {correctCount: 0, responses: []}}), (err, id) ->
      Router.go 'quiz', sessId: id
