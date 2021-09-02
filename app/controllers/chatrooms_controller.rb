class ChatroomsController < ApplicationController
  layout 'green_background', only: [:show]
  def show
    @chatroom = Chatroom.find(params[:id])
    authorize @chatroom
    @message = Message.new
  end
end
