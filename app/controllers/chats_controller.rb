class ChatsController < ApplicationController
    before_action :set_chat, only: [:show]
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    
    
    def index
      @chats = Chat.all
 
    end
  
  
    def show
     @reply = @chat.replies
     @user = @chat.user 
    end
  
  
    def new
      @chat = current_user.chats.build
  
    end
  
  
    def create
      @chat = current_user.chats.build(chat_params)
      if @chat.save
        redirect_to chats_path(@chat), notice: "チャットを作成しました"
      else
        flash.now[:alert] = 'チャットの投稿に失敗しました'
        render new_chat_path
      end
    end
  
  
    def edit
      @chat = current_user.chats.find(params[:id])
  
    end
  
  
    def update
      @chat = current_user.chats.find(params[:id])
      if @chat.update(chat_params)
        redirect_to chat_path(@chat),notice: '更新できました'
      else
        flash.now[:error] = '更新できませんでした'
        render :edit
      end
  
  
    end
  
 
    def destroy
      chat = current_user.chats.find(params[:id])
      chat.destroy!
      redirect_to chats_path(@chat), notice: '削除に成功しました'
  
    end
  
    private
 
    def chat_params
      params.require(:chat).permit(:content)
    end
   
    def set_chat
     @chat = Chat.find(params[:id])
   end
 
 end
 
 