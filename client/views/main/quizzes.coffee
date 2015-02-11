Template.quizzes.helpers
  quizzes: -> Quizzes.find()

Template.quizzes.events
  'submit form#send-message': (e, t) ->
    e.preventDefault()
    Meteor.call 'sendMsg', t.$('#msgemail').val(), t.$('#message').val()
    t.$('#msgemail').val('')
    t.$('#message').val('')
