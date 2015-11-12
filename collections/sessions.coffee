@Sessions = new Mongo.Collection 'sessions'

Sessions.attachSchema new SimpleSchema
  quiz:
    type: Object
    blackbox: true
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
