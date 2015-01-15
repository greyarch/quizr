Template.admin.rendered = ->
  Meteor.subscribe 'quizes'

Template.admin.helpers
  quizes: -> Quizes.find()
  quiz: -> EJSON.stringify(Quizes.findOne(_id: Session.get('selectedQuizId')), indent: 4)
  activeQuiz: -> if Session.equals('selectedQuizId', @_id) then 'active' else ''

Template.admin.events
  'click #btn-save': (e, t) -> Meteor.call 'updateQuiz', EJSON.parse(t.find('#q').value)
  'click #btn-delete': -> Meteor.call 'removeQuiz', Session.get('selectedQuizId')
  'click #btn-new': ->
    quizName = prompt('Име на куиза', 'Хептен чисто нов');
    if quizName then Meteor.call 'addQuiz', createQuiz(quizName), (err, res) ->
      unless err then Session.set 'selectedQuizId', res
  'click li': -> Session.set 'selectedQuizId', @_id

createQuiz = (qn) ->
    name: qn.trim()
    slug: qn.trim().toLowerCase().replace(/[?|!|,|\.]/gi, '').replace(/\s+/gi, '-')
    image: ''
    description: ''
    questions: [
      question: 'Въпрос номер 1'
      image: 'https://d27v936kxrwe69.cloudfront.net/transloadit/f1/3fdc107b0311e4bf42c9440c4a0fd6/1.jpg'
      ord: 1
      answers: [
        text: 'Отговор 1'
      ,
        text: 'Отговор 2'
      ,
        text: 'Верен отговор'
        correct: true
      ,
        text: 'Отговор 4'
      ]
    ,
      question: 'Въпрос номер 2'
      image: 'https://d27v936kxrwe69.cloudfront.net/transloadit/c9/e74f707b0511e4a068cb36d84f9052/3.jpg'
      ord: 2
      answers: [
        text: 'Отговор 1'
      ,
        text: 'Отговор 2'
      ,
        text: 'Верен отговор'
        correct: true
      ,
        text: 'Отговор 4'
      ]
    ]
