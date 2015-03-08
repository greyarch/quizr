Meteor.startup ->

  Router.configure
    layoutTemplate: 'layout'
    loadingTemplate: 'loading'

  Router.map ->
    @route 'root',
      path: '/'
      template: 'quizzes'
      layout: false
      fastRender: true
      waitOn: ->
        Meteor.subscribe 'quizzes'
    @route 'quiz',
      path: '/q/:sessId'
      template: 'quiz'
      fastRender: true
      waitOn: ->
        Meteor.subscribe 'session', @params.sessId
    @route 'start',
      path: '/start/:quiz/:sessId?'
      template: 'startPage'
      fastRender: true
      waitOn: ->
        [Meteor.subscribe('quiz', @params.quiz), Meteor.subscribe('session', @params.sessId)]
    @route 'result',
      path: '/result/:sessId'
      template: 'result'
      waitOn: ->
        Meteor.subscribe 'session', @params.sessId
