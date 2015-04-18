Template.result.helpers
  session: -> Sessions.findOne()

Template.share.helpers
  shareData: ->
    title: @result?.text
    author: -> window.location.origin
    summary: "Аз отговорих правилно на #{@result?.percentage}% от въпросите, а вие?"
    url: "#{window.location.origin}/start/#{@quiz?.slug}/#{@_id}"
    thumbnail: => @quiz.shareImage || @quiz.image
