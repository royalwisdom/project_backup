class ArticlesController < ApplicationController

  def index
    @article = Article.find(params[:id])
  end

  def show
    @article = Article.find(params[:id])
  end
end
