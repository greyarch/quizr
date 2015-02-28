Template.startPage.helpers
  quiz: ->
    quiz = Quizzes.findOne(slug: @quiz)
    $('body').css('background-image', "url(#{quiz?.image})") # a bit hacky way to set the background
    $('body').css('background-size', 'cover')
    quiz

  session: -> Sessions.findOne()

  shareData: ->
    title: @result?.text
    author: -> window.location.origin
    summary:
      "Аз постигнах #{@result?.percentage}% на #{@quiz?.name}! Ти как ще се справиш?"
    url: "#{window.location.origin}/result/#{@_id}"
    thumbnail: => @quiz.image

Template.startPage.destroyed = ->
    $('body').css 'background-image', '' # a bit hacky way to reset the background

Template.startPage.events
  'click #startButton': (e, t) ->
    Sessions.insert _.extend({quiz: @}, {result: {currentQuestion: 1, correctCount: 0, responses: []}}), (err, id) ->
      Router.go 'quiz', sessId: id
