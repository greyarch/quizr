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
      auxCollections: ['Quizzes']
    Sessions:
      icon: 'bar-chart'
      color: 'red'
      tableColumns: [
        {label: 'Куиз', name: "quiz.name"}
        {label: 'Резултат, %', name: "result.percentage"}
        {label: 'Последен въпрос', name: "result.currentQuestion"}
        {label: 'Създаден на', name: "createdAt"}
      ]
      auxCollections: ['Sessions']
  dashboard:
      homeUrl: '/'

AdminDashboard.addSidebarItem 'Featured quizzes', AdminDashboard.path('/featured'), icon: 'thumbs-up'
