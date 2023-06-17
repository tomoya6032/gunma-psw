class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles, dependent: :destroy
  has_many :likes,dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :replies, dependent: :destroy
  # has_many :informations, dependent: :destroy
  has_one_attached :avatar, dependent: :destroy

  has_many :following_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :followings, through: :following_relationships, source: :following

  has_many :follower_relationships, foreign_key: 'following_id', class_name: 'Relationship', dependent: :destroy
  has_many :followers, through: :follower_relationships, source: :follower

  include Rails.application.routes.url_helpers

  # def avatar_url
  #   if avatar.attached?
  #     rails_blob_path(avatar, only_path: true)
  #   else
  #     '../default-avatar.png' # デフォルトのアバター画像のパスを指定
  #   end
  # end

  def has_written?(article)
    articles.exists?(id: article.id)
  end

  def has_written2?(information)
    informations.exists?(id: information.id)
  end

  def has_written3?(chat)
    chats.exists?(id: chat.id)
  end

  def has_liked?(article)
    likes.exists?(article_id: article.id)
  end

  def has_favorited?(chat)
    favorites.exists?(chat_id: chat.id)
  end

  def display_name
    profile&.nickname.presence || self.email.split('@').first
  end

  def follow!(user)
    # if user.is_a?(User)
    #   user_id = user.id
    # else
    #   user_id = user
    # end  
    user_id = get_user_id(user)
    following_relationships.create!(following_id: user_id)
  end

  def unfollow!(user)
    # if user.is_a?(User)
    #   user_id = user.id
    # else
    #   user_id = user
    # end  
    user_id = get_user_id(user)
    relation = following_relationships.find_by(following_id: user_id)
    relation.destroy!
  end

  def has_followed?(user)
    following_relationships.exists?(following_id: user.id)
  end



  def prepare_profile
    profile || build_profile
  end

  def avatar_image
    if profile&.avatar&.attached?
      profile.avatar
    else
      'default-avatar.png'
    end
  end
  
private
  def get_user_id(user)
    if user.is_a?(User)
      # user_id = user.id
      user.id
    else
      # user_id = user
      user
    end  
  end  

end
