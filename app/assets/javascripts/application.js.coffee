#= require jquery
#= require jquery_ujs
#= require underscore-min
#= require websocket_rails/main
#= require twitter_streaming_sample
#= require_tree .

$ ->
  $body = $("body")
  controller = $body.data("controller").replace(/\//, "_")
  action = $body.data("action")

  activeController = window.TwitterStreamingSample[controller]

  if activeController isnt undefined && $.isFunction(activeController[action])
    activeController[action]()
