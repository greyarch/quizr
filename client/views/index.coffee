Template.loading.rendered = ->
  unless Session.get('loadingSplash')
    @loading = window.pleaseWait
      logo: false
      backgroundColor: '#7f8c8d'
      loadingHtml: message + spinner

    Session.set 'loadingSplash', true

Template.loading.destroyed = ->
  if @loading then @loading.finish()


message = '<p class="loading-message">ЗАРЕЖДА СЕ...</p>'
spinner = '<div class="sk-spinner sk-spinner-rotating-plane"></div>'
