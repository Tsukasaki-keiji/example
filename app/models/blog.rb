class Blog < ApplicationRecord

  belongs_to :user, optional: true
  has_many :post_comments, dependent: :destroy

  attachment :image
  validates :image, presence: true
  validates :title, :body, presence: true

end
