class ArticlesController < ApplicationController
  

    before_action :set_article, only: [:show]
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  
      def index
        @articles = Article.all
  
      end
  
  
      def show
        @comment = @article.comments
        @user = @article.user 
      end
  
      
      def new
        @article = current_user.articles.build
  
      end
  
  
      def create
        @article = current_user.articles.build(article_params)
        
        if @article.save
          @article.images.attach(params[:article][:images])
          redirect_to article_path(@article), notice: '保存ができたよ'
        else
          flash.now[:error] = '保存に失敗しました'
          render :new
        end
      end
  
  
      def edit
        @article = current_user.articles.find(params[:id])
        @user = @article.user 
      end
  
  
      def update
        @article = current_user.articles.find(params[:id])
        
        if @article.update(article_params)
          redirect_to article_path(@article),notice: '更新できました'
        else
          flash.now[:error] = '更新できませんでした'
          render :edit
        end
  
      end
  
      def destroy
        article = current_user.articles.find(params[:id])
        article.destroy!
        redirect_to articles_path(@article), notice: '削除に成功しました'
  
      end
  
      private
      def article_params
        params.require(:article).permit(:title, :content, :eyecatch, images: [])
      end
  
      def set_article
        @article = Article.find(params[:id])
      end
  
  end