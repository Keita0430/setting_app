class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  before_action :current_user, only: :show
  
  def show
    # before_actionを通すことで、showアクションとビューで@current_user変数が使える。
    @user = User.find(params[:id])
    rooms= @current_user.user_rooms.pluck(:room_id) #ログインユーザーが持つチャットルームに関連付けられた中間テーブルのroom_idカラムを配列として取得
    user_rooms = UserRoom.find_by(user_id: @user.id, room_id: rooms) #

    unless user_rooms.nil? #中間テーブルが存在する場合(ログインユーザーがチャットルームを持っている場合)
      @room = user_rooms.room
      
    end
  end
    
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "ようこそデキ婚斡旋サイトへ！"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
    
    if request.path == edit_user_path(@user)
      render "users/edit"
    else
      render "users/#{params[:name]}"
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "個人情報を変更しました"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "ユーザーを削除しました"
    redirect_to root_url
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :gender, :email, :password,
                                   :password_confirmation, :avatar, :nickname,
                                   :age, :blood, :personality, :height, :body,
                                   :from, :job, :income, :ed, :holiday, :alcohol,
                                   :tabacco, :self_pr)
    end
    
    # beforeアクション
    
    # 正しいユーザーかどうか確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    
    # 管理者かどうか確認
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
