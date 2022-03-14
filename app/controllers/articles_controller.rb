class ArticlesController < ApplicationController
  
  
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    # article = Article.new(title: params[:article][:title], description: params[:article][:description])
    # article.save
    # render plain: params[:article].inspect
    @article = Article.new(article_params)
  
    if @article.save
      redirect_to @article
      redirect_to articles_path
    else
      render :new, status: :unprocessable_entity
    end
    
  end

  private
    def article_params
      params.require(:article).permit(:title, :description)
    end


end