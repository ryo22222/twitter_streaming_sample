class StreamingsController < ApplicationController
  include ::ActionView::Helpers::JavaScriptHelper

  protect_from_forgery with: :null_session, only: [:create]

  def show
  end

  def create
    tweet = {}
    tweet[:text] = escape_javascript(params[:tweet][:text])
    tweet[:screen_name] = escape_javascript(params[:tweet][:screen_name])
    tweet[:icon_url] = params[:tweet][:icon_url]
    WebsocketRails[:streaming].trigger "create", tweet
    head :ok
  end
end
