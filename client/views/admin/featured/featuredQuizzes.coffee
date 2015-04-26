Template.featuredQuizzes.helpers
  featured: -> Quizzes.find {featured: true}, {sort: name: 1}
  nonFeatured: -> Quizzes.find {featured: $not: true}, {sort: name: 1}

Template.featuredQuizzes.events
  "click .featured-quiz": (e, t) -> Meteor.call 'setFeatured', @_id, false
  "click .non-featured-quiz": (e, t) -> Meteor.call 'setFeatured', @_id, true
