@Quizzes = new Mongo.Collection 'quizzes'

Meteor.startup ->
  ResultRangeSchema = new SimpleSchema
    "bottom":
      type: Number
      label: 'Долна граница, %'
    "top":
      type: Number
      label: 'Горна граница, %'
    "text":
      type: String
      label: 'Текст за този интервал'

  AnswerSchema = new SimpleSchema
    "text":
      type: String
      label: '* Текст'
    "correct":
      type: Boolean
      label: 'Това е верен отговор'

  QuestionSchema = new SimpleSchema
    "question":
      type: String
      label: '* Текст'
    "ord":
      type: Number
      label: '* Пореден номер'
    "image":
      type: String
      label: 'Линк към картинка'
      optional: true
      regEx: SimpleSchema.RegEx.Url
    "answers":
      type: [AnswerSchema]
      label: 'Отговор'

  Quizzes.attachSchema new SimpleSchema
    name:
      type: String
      label: '* Заглавие'
    published:
      type: Boolean
      label: 'Публикуван куиз'
    featured:
      optional: true
      type: Boolean
      label: "Препоръчан куиз"
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
    shareImage:
      type: String
      label: 'Линк към картинка за споделяне (Facebook, etc.)'
      optional: true
      regEx: SimpleSchema.RegEx.Url
    markers:
      type: String
      label: 'Трасиращи маркери/хаштагове, разделени с интервал: #quizzer-slayer #quizzer-queensryche'
      optional: true
    results:
      type: [ResultRangeSchema]
      label: 'Интервал'
      optional: true
    questions:
      type: [QuestionSchema]
      label: 'Въпрос'
