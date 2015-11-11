

@AdminConfig =
  name: 'Quizzer'
  nonAdminRedirectRoute: 'entrySignIn'
  adminEmails: ['gantchok@yahoo.com', 's.shivarov@gmail.com']
  collections:
    Quizzes:
      icon: 'list'
      color: 'green'
      tableColumns: [
        {label: 'Заглавие', name: 'name'}
        {label: 'Публикуван', name: 'published'}
        {label: 'Линк', name: 'slug'}
      ]
  dashboard:
      homeUrl: '/'

AdminDashboard.addSidebarItem 'Featured quizzes', AdminDashboard.path('/featured'), icon: 'thumbs-up'
AdminDashboard.addSidebarItem 'Assign quizzes to clients', AdminDashboard.path('/quizzes-to-clients'), icon: 'exchange'
