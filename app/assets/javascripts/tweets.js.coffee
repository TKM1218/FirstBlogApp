$(document).on 'page:change', ->
  if $('#number-of-unprocessed-tweets').length
  setInterval(update_number_of_unprocessed_tweets, 1000 * 60)

  update_number_of_unprocessed_tweets = ->
    $('#number-of-unprocessed-tweets').text "(#{data})"
