class FavoritesController < ApplicationController
    before_action :authenticate_user!
  
    def show
      chat = Chat.find(params[:chat_id])
      favorite_status = current_user.has_favorited?(chat)
      render json: { hasFavorited: favorite_status }
    end

    def create
      chat = Chat.find(params[:chat_id])
      chat.favorites.create!(user_id: current_user.id)
      # redirect_to chat_path(chat)
      render json: { status: 'ok' }
    end
    
    def destroy
      chat = Chat.find(params[:chat_id])
      favorite = chat.favorites.find_by!(user_id: current_user.id)
      favorite.destroy!
      # redirect_to chat_path(chat)
      render json: { status: 'ok' }
    end

end