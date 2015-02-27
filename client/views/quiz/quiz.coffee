Template.quiz.created = ->
  @currentQuestion = 1
  @sess = Sessions.findOne _id: @data.sessId
  $('body').css('background-image', "url(#{@sess.quiz?.image})") # a bit hacky way to set the background
  $('body').css('background-size', 'cover')

Template.quiz.helpers
  quiz: -> Template.instance().sess.quiz
  show: -> 'hidden' unless Template.instance().currentQuestion == @ord

Template.quiz.events
  'click button': (e, t) ->
    currData = Template.currentData()
    t.sess.result.responses.push _.extend(currData, @)
    if @correct then t.sess.result.correctCount += 1
    Sessions.update {_id: t.sess._id}, t.sess

    if t.sess.quiz.questions.length == t.currentQuestion
      Router.go 'result', sessId: t.sess._id
    else
      t.currentQuestion += 1
