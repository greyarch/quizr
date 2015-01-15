Template.quizes.created = -> Meteor.subscribe "quizes"

Template.quizes.helpers
  quizes: -> Quizes.find()
