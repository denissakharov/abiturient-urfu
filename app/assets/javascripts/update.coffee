document.addEventListener 'turbolinks:load', ->
  if $('#vkontaktik').length == 1
    $.post '/update',
      (data) ->
        console.log data

  # document.getElementById("query").oninput = ->
  #   $.get '/',
  #     query: $('#query').val(),
  #     (data) ->
  #       if data.length
  #         $('h1.light').hide()
  #         lines = data.map (user) =>
  #           return "<h3 class='fio'><a href='" + user.number + "'>" + user.name + "</a></h3>"
  #         $('.row').html(lines)
  #         console.log lines.join('')
  #       else
  #         $('.row').html('<h1 class="light">Самое время найти себя</h1>')
  #     ,'JSON'
