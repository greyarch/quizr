@Sessions = new Mongo.Collection 'sessions'

Sessions.allow
  insert: -> true
  update: -> true
  remove: -> false

Sessions.attachSchema new SimpleSchema
  quiz:
    type: Object
    blackbox: true
  "quiz.name":
    type: String
  result:
    type: Object
    blackbox: true
  "result.percentage":
    type: Number
  "result.currentQuestion":
    type: Number
  createdAt:
    type: Date
    label: 'Date'
    autoValue: ->
      if this.isInsert
        new Date()
