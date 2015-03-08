Template.startPage.helpers
  quiz: ->
    quiz = Quizzes.findOne()
    $('body').css('background-image', "url(#{quiz?.image})") # a bit hacky way to set the background
    $('body').css('background-size', 'cover')
    quiz

  session: -> Sessions.findOne()

Template.startPage.destroyed = ->
    $('body').css 'background-image', '' # a bit hacky way to reset the background

Template.startPage.events
  'click #startButton': (e, t) ->
    Meteor.call 'createSession', @slug, (err, id) ->
      Router.go 'quiz', sessId: id
