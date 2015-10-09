Template.result.helpers
  session: -> Sessions.findOne()

Template.share.helpers
  shareData: ->
    title: @result?.text
    author: -> window.location.origin
    summary: "Аз отговорих правилно на #{@result?.percentage}% от въпросите, а вие?"
    url: "#{window.location.origin}/start/#{@quiz?.slug}/#{@_id}"
    thumbnail: ->
      quiz = Template.parentData().quiz
      quiz.shareImage || quiz.image

Template.share.events
  'click a.fb-share': -> Meteor.call 'saveShared', Template.currentData()._id, 'facebook'
  'click a.tw-share': -> Meteor.call 'saveShared', Template.currentData()._id, 'twitter'
  'click a.google-share': -> Meteor.call 'saveShared', Template.currentData()._id, 'google+'
