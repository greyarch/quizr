selectedClientId = new ReactiveVar null
assignedQuizzes = new ReactiveVar []

Template.quizzesToClients.onRendered ->
  selectedClientId.set $('#selectedClient').val()
  @autorun ->
    client = Meteor.users.findOne(_id: selectedClientId.get())
    assignedQuizzes.set(client?.assignedQuizzes or [])

Template.quizzesToClients.helpers
  assigned: -> Quizzes.find _id: $in: assignedQuizzes.get()
  email: -> @emails[0].address
  quizzes: -> Quizzes.find {}, {sort: name: 1}
  clients: -> Meteor.users.find()

Template.quizzesToClients.events
  "change #selectedClient": -> console.log @_id;selectedClientId.set @_id
  "click .available-quiz": ->
    aq = assignedQuizzes.get()
    aq.push @_id
    Meteor.call 'setAssignedQuizzes', selectedClientId.get(), aq
  "click .assigned-quiz": ->
    console.log @_id
    aq = assignedQuizzes.get().filter (q) => q isnt @_id
    console.log aq
    Meteor.call 'setAssignedQuizzes', selectedClientId.get(), aq
