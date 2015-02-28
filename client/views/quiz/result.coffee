Template.result.helpers
  session: -> Sessions.findOne()

  shareData: ->
    title: @result?.text
    author: -> window.location.origin
    summary:
      "Аз постигнах #{@result?.percentage}% на '#{@quiz?.name}'! Ти как ще се справиш?"
    url: "#{window.location.origin}/start/#{@quiz?.slug}/#{@_id}"
    thumbnail: => @quiz.image
