Template.quizzes.created = ->
  $('body').css 'background-image', '' # a bit hacky way to reset the background

Template.quizzes.helpers
  quizzes: -> Quizzes.find()
  featuredQuizzes: -> Quizzes.find featured: true

Template.quizzes.events
  'click .dropdown': (e) -> $(e.target).dropdown('toggle')
  'submit form#send-message': (e, t) ->
    e.preventDefault()
    Meteor.call 'sendMsg', t.$('#msgemail').val(), t.$('#message').val()
    t.$('#msgemail').val('')
    t.$('#message').val('')
