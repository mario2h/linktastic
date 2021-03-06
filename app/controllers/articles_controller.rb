class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @articles = Article.all
  end

  def show
    redirect_to @article.url
  end

  def new
    @article = current_user.articles.new(params[:article])
    @article.user = current_user
  end

  def edit
  end

  def create
    @article = current_user.articles.new(article_params)
    @article.user = current_user

    if @article.save
      redirect_to articles_url, notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  def update
    if @article.update(article_params)
      redirect_to articles_url, notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @article.destroy

    redirect_to articles_url, notice: 'Article was successfully destroyed.'
  end

  def upvote
    @articles = Article.find(params[:id])
    @articles.liked_by current_user

    redirect_to articles_url
  end

  def downvote
    @articles = Article.find(params[:id])
    @articles.disliked_by current_user

    redirect_to articles_url
  end

  private

    def set_article
      @article = Article.find(params[:id])
    end
    def article_params
      params.require(:article).permit(:title, :url)
    end
end
