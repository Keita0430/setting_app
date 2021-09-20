class StaticPagesController < ApplicationController
  def home
    @articles = Article.all.where.not(avatar: nil)
    @board1 = Board.find(1)
    @board2 = Board.find(2)
    @board3 = Board.find(3)
    @board4 = Board.find(4)
  end
end
