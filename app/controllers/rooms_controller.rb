class RoomsController < ApplicationController
  before_action :logged_in_user
  before_action :current_user
  
  def index
    @rooms = @current_user.rooms.includes(:users).order(:id)
    #@userにチャット相手を代入してindex.html.erbで使いたい。
    # @user_room = UserRoom.where(user_id: @current_user.id)
  end
  
  def show
    @room = Room.find(params[:id])
    if UserRoom.where(user_id: @current_user.id, room_id: @room.id).present?
      @messages = @room.messages.includes(:user).order(:id)
      @message = @current_user.messages.build
    else
      redirect_back(fallback_location: root_path)
    end
  end
end