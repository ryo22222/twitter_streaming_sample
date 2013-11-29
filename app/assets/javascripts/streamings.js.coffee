class Streamings
  show: ->
    $streamingView = $(".streaming")
    html  = "<div class='tweet'>"
    html += "  <div class='icon-column'><img src='<%= icon_url %>' /></div>"
    html += "  <div class='text-column'><p><%= text %></p><p class='screen-name'>@<%= screen_name %></p></div>"
    html += "</div>"
    template = _.template(html)

    dispatcher = new WebSocketRails("ws://#{location.host}/websocket")
    channel = dispatcher.subscribe("streaming")
    channel.bind "create", (tweet) ->
      $streamingView.find("div:last").remove() if $streamingView.length > 10
      tweetView = template
        text: tweet.text
        screen_name: tweet.screen_name
        icon_url: tweet.icon_url
      $streamingView.prepend(tweetView)

window.TwitterStreamingSample.streamings = new Streamings
