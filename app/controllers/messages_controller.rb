class MessagesController < ApplicationController 
  before_action :move_to_index
  
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user)
    # @user = User.find(params[:room_id])
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    # message = Message.create(content: params[:content], checked: false)
    # render json:{ message: @message }
    if @message.save
      redirect_to room_messages_path(@room)
    else
      @messages = @room.messages.includes(:user)
      render :index
    end
  end

  def destroy
    message = Message.find(params[:id])
    message.destroy
    redirect_to room_messages_path
  end


  private
  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path unless user_signed_in? 
  end
end
