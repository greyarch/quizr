Template.startPage.helpers
  quiz: ->
    quiz = Quizzes.findOne()
    $('body').css('background-image', "url(#{quiz?.image})") # a bit hacky way to set the background
    $('body').css('background-size', 'cover')
    quiz

  session: -> Sessions.findOne()
  # 
  # shareData: ->
  #   title: @result?.text
  #   author: -> window.location.origin
  #   summary: "Аз отговорих правилно на #{@result?.percentage}% от въпросите, а ти?"
  #   url: "#{window.location.origin}/start/#{@quiz?.slug}/#{@_id}"
  #   thumbnail: => @quiz.shareImage || @quiz.image

Template.startPage.destroyed = ->
    $('body').css 'background-image', '' # a bit hacky way to reset the background

Template.startPage.events
  'click #startButton': (e, t) ->
    Sessions.insert
      quiz: @
      result:
        currentQuestion: 1
        correctCount: 0
        responses: []
    , (err, id) ->
      console.log err, id
      Router.go 'quiz', sessId: id
