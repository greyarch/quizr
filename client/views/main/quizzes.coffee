Template.quizzes.created = ->
  $('body').css 'background-image', '' # a bit hacky way to reset the background

Template.quizzes.rendered = ->
  $('.quiz').bigtext
    maxfontsize: 60
    minfontsize: 16

Template.quizzes.helpers
  quizzes: -> Quizzes.find()

Template.quizzes.events
  'submit form#send-message': (e, t) ->
    e.preventDefault()
    Meteor.call 'sendMsg', t.$('#msgemail').val(), t.$('#message').val()
    t.$('#msgemail').val('')
    t.$('#message').val('')
