Meteor.publish 'quizes', ->
  user = Meteor.users.findOne(_id: @userId)
  if user && ('admin' in user.roles)
    Quizes.find()
  else
    Quizes.find published: true

Meteor.publish 'quiz', (slug) -> Quizes.find slug: slug
