class Blog < ApplicationRecord

  belongs_to :user, optional: true
  has_many :post_comments, dependent: :destroy

  attachment :image
  validates :image, presence: true
  validates :title, :body, presence: true
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
