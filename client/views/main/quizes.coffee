Template.quizes.created = -> Meteor.subscribe "quizes"

Template.quizes.helpers
  quizes: -> Quizes.find()
  textColor: -> if @image then {style: 'color:white'} else ''
