class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    authorize @message
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      data_str = render_to_string(partial: "message", locals: { message: @message })
      data = {
        content: data_str,
        author_id: @message.user.id,
        message_div_id: "#message-#{@message.id}"
      }
      ChatroomChannel.broadcast_to(@chatroom, data)
      redirect_to chatroom_path(@chatroom, anchor: "message-#{@message.id}")
    else
      render "chatrooms/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
