class Streamings
  show: ->
    $streamingView = $(".streaming")
    dispatcher = new WebSocketRails("ws://#{location.host}/websocket")
    channel = dispatcher.subscribe("streaming")
    channel.bind "create", (text) ->
      $streamingView.prepend(text)

window.TwitterStreamingSample.streamings = new Streamings
