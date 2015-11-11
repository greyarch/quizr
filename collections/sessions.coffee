@Sessions = new Mongo.Collection 'sessions'

quizSchema = new SimpleSchema
  name:
    type: String
  slug:
    type: String
  image:
    type: String
  shareImage:
    type: String

Sessions.attachSchema new SimpleSchema
  quiz:
    type: quizSchema
  result:
    type: Object
    blackbox: true
  createdAt:
    type: Date
    label: 'Created'
    autoValue: -> if @isInsert then new Date()
  updatedAt:
    type: Date
    label: 'Updated'
    autoValue: -> new Date()
