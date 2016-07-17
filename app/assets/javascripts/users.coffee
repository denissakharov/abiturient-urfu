document.addEventListener 'turbolinks:load', ->
  if $('#vkontaktik').length == 1
    $.post '/update',
      (data) ->
        console.log data
