Meteor.publish 'quizes', -> Quizes.find {}
Meteor.publish 'quiz', (slug) -> Quizes.find {slug: slug}
