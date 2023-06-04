class Article < ApplicationRecord
  has_one_attached :eyecatch
  has_rich_text :content
  has_many_attached :images
  # has_one_attached :image
  validates :title, presence: true
  validates :title, length: { minimum: 2, maximum: 100  }
  validates :title, format: { with: /\A(?!\@)/ }

  # validates :content, presence: true
  # validates :content, length: { minimum: 10 }
  # validates :content, uniqueness: true
  # validate :validate_title_and_content_length

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :user


  def display_created_at
    I18n.l(self.created_at, format: :default)
  end

  def author_name
    user.display_name
  end

  def like_count
    likes.count
  end

  def avatar_image
    if profile&.avatar&.attached?
      profile.avatar
    else
      'default-avatar.png'
    end
  end


  # private
  # def validate_title_and_content_length
  #   char_count = self.title.length + self.content.length
  #   errors.add(:content, '10文字以上必要です')unless char_count > 10
  # end


end
