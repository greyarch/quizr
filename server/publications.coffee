Meteor.publish 'quizzes', ->
  user = Meteor.users.findOne(_id: @userId)
  if user && ('admin' in user.roles)
    Quizzes.find()
  else
    Quizzes.find published: true

Meteor.publish 'quiz', (slug) -> Quizzes.find slug: slug
Meteor.publish 'session', (id) -> Sessions.find _id: id
