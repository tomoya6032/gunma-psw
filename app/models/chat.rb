class Chat < ApplicationRecord
  
  belongs_to :user
  has_many :replies
  has_many :favorites, dependent: :destroy
  has_rich_text :content

  # validates :content, length: { minimum: 3 }


  # validates :content, presence: true
  # validates :content, uniqueness: true
  validates :content, length: { maximum: 300 }, presence: true

  def display_created_at
    I18n.l(self.created_at, format: :default)
  end

  def author_name
    user.display_name
  end

  def favorite_count
    favorites.count
  end

  # def truncated_content(rich_text)
  #   truncate(rich_text.to_plain_text, length: 10, separator: "...")
  # end




end


