class Reply < ApplicationRecord
    belongs_to :chat
    belongs_to :user
    has_one_attached :avatar
    validates :content, presence: true
      
    def avatar_image
      if profile&.avatar&.attached?
         profile.avatar
      else
         'default-avatar.png'
      end
    end
  
  end
  