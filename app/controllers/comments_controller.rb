class CommentsController < ApplicationController
    before_action :set_comment, only: [:show]
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    respond_to :json
 
 
    def index    
       # article = Article.find(params[:article_id])
       # comments = article.comments
       # render json: comments
       article = Article.find(params[:article_id])
       comments = article.comments
       render json: comments.to_json(include: :user)
    end
   
   
    def show
      
       @comment = Comment.find_by(id: params[:id])
       @user = User.find_by(id: @comment.user_id)
       @comments = @article.comments
    end
   
   
    def new
       article = Article.find(params[:article_id])
       @comment = article.comments.build
   
    end
   
   
    def create
       article = Article.find(params[:article_id])
       @comment = article.comments.build(comment_params)
       @comment.user = current_user
       @comment.save!
      
       render json: @comment
       
       # if @comment.save
       #    render json: { comment: @comment, user: @comment.user, profile: @comment.user.profile }
       # else
       #    render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
       # end
       
   
    end
   
   
    def edit
   
   
    end
   
   
    def update
   
   
    end
   
  
    def destroy
   
   
    end
   
    private
    def comment_params
       params.require(:comment).permit(:content)
    #   params.require(:comment).permit(:id, :content, :user_id, :created_at, :updated_at)
 
    end
 
    def set_article
      @comment = Comment.find(params[:id])
      
    end
 
 end
 