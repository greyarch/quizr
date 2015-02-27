Template.result.created = ->
  Meteor.subscribe 'session', @data.sessId

Template.result.helpers
  result: ->
    sess = Sessions.findOne(_id: Template.instance().data.sessId)
    calculateResult(sess) if sess
  resultText: ->
    sess = Sessions.findOne(_id: Template.instance().data.sessId)
    if sess
      res = calculateResult(sess)
      _.find(sess.quiz.results, (result) -> result?.bottom <= res <= result?.top)?.text

  shareData: ->
    title: 'title'
    author: => 'http://quizzer.bg'
    summary: 'summary'
    url: "http://qzr.meteor.com/result/#{@sessId}"
    # sitenap:  'http://qzr.meteor.com'
    thumbnail: => 'http://files.quizzer.bg/Shutta/cover.jpg'


calculateResult = (session) -> Math.round(100 * session.result.correctCount / session.quiz.questions.length)
