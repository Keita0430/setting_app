class RoomsController < ApplicationController
  before_action :logged_in_user
  before_action :current_user
  
  def index
    @rooms = @current_user.rooms.includes(:users).order(:id)
    #@userにチャット相手を代入してindex.html.erbで使いたい。
    # @user_room = UserRoom.where(user_id: @current_user.id)
  end
  
  def new
    @room = Room.new
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.find(params[:user_id])
    @room = Room.new
    
    if @room.save!
      UserRoom.create!(user_id: @current_user.id, room_id: @room.id)
      UserRoom.create!(user_id: @user.id, room_id: @room.id)
      flash[:success] =  "チャットを開始します"
      redirect_to @room
    end
    # @rooom = Room.new
    # @room.save
  end
  
  def show
    @room = Room.find(params[:id])
    if UserRoom.where(user_id: @current_user.id, room_id: @room.id).present?
      @message = @current_user.messages.build
      @messages = @room.messages.includes(:user).order(:id)
      # @message_by_other = Message.find_by(room_id: @room_id, user_id: !@current_user.id)
    else
      redirect_back(fallback_location: root_path)
    end
  end
end