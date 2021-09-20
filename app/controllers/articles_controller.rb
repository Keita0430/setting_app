class ArticlesController < ApplicationController
  def index
    @articles = Article.all.where.not(avatar: nil)
  end
  
  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
    
    if @article.save
      flash[:success] = "新規投稿をしました"
      redirect_to articles_path
    else
      redirect_to article_path
    end
  end
    
  def destroy
      Article.find(params[:id]).destroy
      flash[:success] = "ユーザーを削除しました"
      redirect_back(fallback_location: root_path)
  end
  
  private
    
    def article_params
      params.require(:article).permit(:content, :title, :description, :avatar)
    end
end
