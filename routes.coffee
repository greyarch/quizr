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
      data: -> {sessId : @params.sessId}
    @route 'start',
      path: '/start/:quiz'
      template: 'startPage'
      waitOn: ->
        Meteor.subscribe 'quiz', @params.quiz
      data: -> {'quiz' : @params.quiz}
    @route 'result',
      path: '/result/:sessId'
      template: 'result'
      data: -> sessId : @params.sessId
