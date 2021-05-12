class PostsController < ApplicationController
  before_action :logged_in_user
  before_action :current_user
  
  # def new
  #   @post = Post.new
  # end
  
  def create
    @board = Board.find(params[:id])
    @post = @current_user.posts.build(post_params)
    
    if @post.save
      flash[:success] = "新規投稿をしました"
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  def show
  end
  
  def destroy
  end
  
  private
  
    def post_params
      params.require(:post).permit(:content).merge(board_id: @board.id)
    end
end