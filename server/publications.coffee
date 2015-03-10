Meteor.publish 'quizzes', ->
  user = Meteor.users.findOne(_id: @userId)
  fields = {fields: {name: 1, image: 1, slug: 1}}
  if user && ('admin' in user.roles)
    Quizzes.find {}, fields
  else
    Quizzes.find {published: true}, fields

Meteor.publish 'quiz', (slug, fields) ->
  if fields
    Quizzes.find {slug: slug}, {fields: fields}
  else
    Quizzes.find slug: slug
Meteor.publish 'session', (id, fields) -> Sessions.find {_id: id}, fields || {}
