class ChatHistoriesController < ApplicationController
  before_action :authenticate_user!

    def show
        user_ids = current_user.followings.pluck(:id)
        @chats = Chat.where(user_id: user_ids)

        
    end
end
