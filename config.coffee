@AdminConfig =
  name: 'Quizer'
  nonAdminRedirectRoute: 'entrySignIn'
  adminEmails: ['gantchok@yahoo.com']
  dashboard:
    homeUrl: '/admin'
  collections:
    Quizes:
      icon: 'list'
      color: 'green'
      tableColumns: [
        {label: 'Заглавие', name: 'name'}
        {label: 'Публикуван', name: 'published'}
        {label: 'Линк', name: 'slug'}
      ]
