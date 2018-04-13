$(document).on 'page:change', ->
  $("#tag-it").tagit(
    afterTagAdded: (e, ui) ->
      unless ui.duringInitialization
        tweet_id = $("#tag-it").data('tweet-id')
    afterTagRemoved: (e, ui) ->
      unless ui.duringInitialization
        tweet_id = $("#tag-it").data('tweet-id')
        )
