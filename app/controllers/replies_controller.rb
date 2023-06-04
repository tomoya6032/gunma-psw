class RepliesController < ApplicationController
    before_action :set_reply, only: [:show]
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    respond_to :json

    def index   
        
        chat = Chat.find(params[:chat_id])
        replies = chat.replies
        render json: replies.to_json(include: :user)
    
    end
    
    
    def show
        # @chat = Chat.find_by(id: params[:id])
        # @replies = Reply.where(chat_id: @chat.id)
        # # @reply = Reply.find_by(id: params[:id])
        # # @user = User.find_by(id: @reply.user_id)
        # @replies = @chat.replies

        chat = Chat.find(params[:chat_id])
        @replies = chat.replies
        @reply = @replies.find(params[:id])
        
    end
    
    
    def new
        chat = Chat.find(params[:chat_id])
        @reply = chat.replies.build
    
    end
    
    
    def create
        chat = Chat.find(params[:chat_id])
        @reply = chat.replies.build(reply_params.merge!(user_id: current_user.id))
        # @reply = chat.replys.build(reply_params)

        # if @reply.save
        #     redirect_to chat_path(chat), notice: '返信を追加' 
        # else
        # flash.now[:error] = '更新できませんでした'
        # render :new
        # end
        @reply.user = current_user
        @reply.save!
     
        render json: @reply
    
    end
    
    
    def edit
    
    
    end
    
    
    def update
    
    
    end
    
    
    def destroy
    
    
    end

    private
    def reply_params
      params.require(:reply).permit(:content, :chat_id, :user_id)
    end

    def set_reply
      @reply = Reply.find(params[:id])
    end
end