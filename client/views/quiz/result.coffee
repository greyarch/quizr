Template.result.onRendered ->
  $('body').css('background-image', "url(#{Sessions.findOne().quiz?.image})") # a bit hacky way to set the background
  $('body').css('background-size', 'cover')

Template.result.helpers
  session: -> Sessions.findOne()
  markers: ->
    console.log @quiz?.markers
    @quiz?.markers

Template.share.helpers
  shareData: ->
    title: "#{@result?.text}"
    author: -> window.location.origin
    summary: "Аз отговорих правилно на #{@result?.percentage}% от въпросите, а вие?"
    url: "#{window.location.origin}/start/#{@quiz?.slug}/#{@_id}"
    thumbnail: =>
      quiz = @?.quiz
      quiz?.shareImage or quiz?.image

Template.share.events
  'click a.fb-share': -> Meteor.call 'saveShared', Template.currentData()._id, 'facebook'
  'click a.tw-share': -> Meteor.call 'saveShared', Template.currentData()._id, 'twitter'
  'click a.google-share': -> Meteor.call 'saveShared', Template.currentData()._id, 'google+'
