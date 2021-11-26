class CommentsController < ApplicationController
  # before_action action is sequential
  before_action :set_article
  before_action :article_comments, only: [:index, :create]
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :comment_init, only: [:index, :new]
  
  def index
  end

  def new
  end

  def create
    @comment = @article.comments.build(comment_params)

    if @comment.save
      redirect_to article_comments_path(@article)
    else
      render :index
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to article_comments_path(@article)
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy

    redirect_to article_comments_path(@article)
  end

  private

  def comment_params
    @comment = params.require(:comment).permit(:content)
  end

  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_comment
    @comment = @article.comments.find(params[:id])
  end

  def article_comments
    @comments = @article.comments.where.not(id: nil)
  end
  
  def comment_init
    @comment =  @article.comments.build
  end
end
