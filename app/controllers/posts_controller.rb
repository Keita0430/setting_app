class PostsController < ApplicationController
  before_action :logged_in_user
  before_action :current_user
  
  def new
    @post = @current_user.posts.build
    @board = Board.find(params[:board_id])
  end
  
  def create
    @board = Board.find(params[:board_id])
    @post = @current_user.posts.build(post_params)
    
    if @post.save
      flash[:success] = "新規投稿をしました"
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  def destroy
      Post.find(params[:id]).destroy
      flash[:success] = "投稿を削除しました"
      redirect_back(fallback_location: root_path)
  end
  
  private
  
    def post_params
      params.require(:post).permit(:industry, :eb, :day, :place, :conditions, :ng, :self_pr).merge(board_id: @board.id)
    end
end