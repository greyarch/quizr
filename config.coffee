@AdminConfig =
  name: 'Quizzer'
  nonAdminRedirectRoute: 'entrySignIn'
  adminEmails: ['gantchok@yahoo.com', 's.shivarov@gmail.com']
  dashboard:
    homeUrl: '/'
  collections:
    Quizes:
      icon: 'list'
      color: 'green'
      tableColumns: [
        {label: 'Заглавие', name: 'name'}
        {label: 'Публикуван', name: 'published'}
        {label: 'Линк', name: 'slug'}
      ]

Meteor.startup ->
  AccountsEntry.config
    homeRoute: '/'
    dashboardRoute: '/admin'
    profileRoute: 'profile'
    passwordSignupFields: 'EMAIL_ONLY'
