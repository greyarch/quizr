Meteor.startup ->

  Router.configure
    layoutTemplate: 'layout'

  Router.map ->
    @route 'quiz',
      path: '/q/:quiz'
      template: 'quiz'
      data: -> {'quiz' : @params.quiz}
    @route 'root',
      path: '/'
      template: 'quizes'
