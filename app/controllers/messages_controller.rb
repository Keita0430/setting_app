class MessagesController < ApplicationController
  before_action :current_user, only: :create
  
  def create
    @room = Room.find(params[:id])
    @message = @current_user.messages.create!(message_params)
    # 投稿されたチャットをチャット相手に配信する
    ActionCable.server.broadcast "room_channel", message: @message.template
  end
  
  private
    def message_params
      params.require(:message).permit(:content).merge(room_id: @room.id)
    end
end