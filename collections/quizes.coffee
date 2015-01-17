@Quizes = new Mongo.Collection 'quizes'

Meteor.startup ->
  Quizes.attachSchema new SimpleSchema
    name:
      type: String
      label: '* Заглавие'
    published:
      type: Boolean
      label: 'Публикуван куиз'
    slug:
      type: String
      label: '* Линк към куиза'
      regEx: /[\S-]+/
    description:
      type: String
      label: 'Описание'
      optional: true
      autoform:
        rows: 2
    image:
      type: String
      label: 'Линк към картинка'
      optional: true
      regEx: SimpleSchema.RegEx.Url
    questions:
      type: [Object]
      label: 'Въпрос'
    "questions.$.question":
      type: String
      label: '* Текст'
    "questions.$.ord":
      type: Number
      label: '* Пореден номер'
    "questions.$.image":
      type: String
      label: 'Линк към картинка'
      optional: true
      regEx: SimpleSchema.RegEx.Url
    "questions.$.answers":
      type: [Object]
      label: 'Отговор'
    "questions.$.answers.$.text":
      type: String
      label: '* Текст'
    "questions.$.answers.$.correct":
      type: Boolean
      label: 'Това е верен отговор'
