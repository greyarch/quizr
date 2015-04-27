resultFields =
  fields:
    "result.percentage": 1
    "result.text": 1
    "quiz.slug": 1
    "quiz.shareImage": 1
    "quiz.image": 1

Meteor.startup ->

  Router.configure
    layoutTemplate: 'layout'
    loadingTemplate: 'loading'

  Router.map ->
    @route 'root',
      path: '/'
      template: 'quizzes'
      layout: false
      waitOn: ->
        Meteor.subscribe 'quizzes'
    @route 'quiz',
      path: '/q/:sessId'
      template: 'quiz'
      waitOn: ->
        Meteor.subscribe 'session', @params.sessId
    @route 'start',
      path: '/start/:quiz/:sessId?'
      template: 'startPage'
      waitOn: ->
        [Meteor.subscribe('quiz', @params.quiz, {name: 1, image: 1, description: 1, slug: 1}),
        Meteor.subscribe('session', @params.sessId, resultFields)]
    @route 'result',
      path: '/result/:sessId'
      template: 'result'
      waitOn: ->
        Meteor.subscribe 'session', @params.sessId, resultFields

    # admin routes

    @route 'adminFeaturedQuizzes',
      path: '/admin/featured'
      template: 'featuredQuizzes'
      layoutTemplate: 'AdminLayout'
      waitOn: ->
        Meteor.subscribe 'quizzes for featuring'
