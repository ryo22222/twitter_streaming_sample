class StreamingsController < ApplicationController
  protect_from_forgery with: :null_session, only: [:create]

  def show
  end

  def create
    WebsocketRails[:streaming].trigger "create", params[:tweet]
    head :ok
  end
end
