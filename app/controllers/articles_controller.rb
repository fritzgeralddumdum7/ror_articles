class ArticlesController < ApplicationController
  # assign set_article to specific method
  before_action :set_article, only: [:edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      # flash short hand assignment
      redirect_to articles_path, notice: 'New article has been created.'
    else
      # flash long hand assignment
      flash[:error] = 'New article has been created.'
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to articles_path
    else
      render :edit
    end
  end

  def destroy
    @article.destroy

    redirect_to articles_path
  end

  private
  
  def article_params
    params.required(:article).permit(:title, :author, :content)
  end

  def set_article
    @artist = Article.find(params[:id])
  end
end
