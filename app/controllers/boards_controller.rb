class BoardsController < ApplicationController
  before_action :logged_in_user
  before_action :current_user
  
  def index
    @boards = Board.all
  end
  
  def new
    @board = Board.new
  end
  
  def create
    @board = Board.new(board_params)
    if @board.save
      flash[:success] = "新たな地区の掲示板を追加しました！"
      redirect_to boards_path
    else
      render 'new'
    end
  end
  
  def show
    @board = Board.find(params[:id])
    @post = @current_user.posts.build
    @posts = @board.posts.includes(:user)
    # .paginate(page: params[:page])
  end
  
  # def destroy
  #   @board = Board.find(params[:id])
  #   @board.destroy
  #   flash[:success] = "Board deleted"
  #   redirect_to request.referrer || root_url
  # end
  
  private

    def board_params
      params.require(:board).permit(:district_name)
    end
    
    
end
