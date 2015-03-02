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
        [Meteor.subscribe('quiz', @params.quiz), Meteor.subscribe('session', @params.sessId)]
    @route 'result',
      path: '/result/:sessId'
      template: 'result'
      waitOn: ->
        Meteor.subscribe 'session', @params.sessId
