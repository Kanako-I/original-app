class RoomsController < ApplicationController
  before_action :move_to_index
  
  def index
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_path
    else
      render :new
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to rooms_path
  end

  def update 
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to "/rooms/#{@room.id}/messages"
    else
      render :edit
    end
  end

  def edit
    @room = Room.find(params[:id])
  end


  private
  def room_params
    params.require(:room).permit(:name, user_ids: []).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path unless user_signed_in? 
  end
end
