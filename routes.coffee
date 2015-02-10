Meteor.startup ->

  Router.configure
    layoutTemplate: 'layout'
    loadingTemplate: 'loading'

  Router.map ->
    @route 'quiz',
      path: '/q/:quiz'
      template: 'quiz'
      waitOn: ->
        Meteor.subscribe 'quiz', @params.quiz
      data: -> {'quiz' : @params.quiz}
    @route 'root',
      path: '/'
      template: 'quizzes'
      layout: false
      waitOn: ->
        Meteor.subscribe 'quizzes'
