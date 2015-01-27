Meteor.startup ->
  AccountsEntry.config
    homeRoute: '/'
    dashboardRoute: '/admin'
    profileRoute: 'profile'
    passwordSignupFields: 'EMAIL_ONLY'
