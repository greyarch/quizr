Template.results.helpers
  result: -> 100 * Session.get('correctCount') / Session.get('questionsCount')
