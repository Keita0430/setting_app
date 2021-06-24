class BoardsController < ApplicationController
  before_action :logged_in_user
  before_action :current_user
  
  def index
    @boards = Board.all
    @boards1 = @boards[0..5]
    @boards2 = @boards[6..11]
    @boards3 = @boards[12..17]
    @boards4 = @boards[18..23]
    
    if request.fullpath == "/boards/option/select"
      render "boards/option"
    elsif request.path == boards_path
      render "boards/index"
    elsif request.fullpath == "/boards/option/index2"
      render "boards/index2"
    elsif request.fullpath == "/boards/option/index3"
      render "boards/index3"
    else
      render "boards/index4"
    end
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
    # @post = @current_user.posts.build
    @posts = @board.posts.includes(:user)
    # .paginate(page: params[:page])
    @post = Post.find(params[:id])
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
