class Blog < ApplicationRecord

  attachment :image
  validates :image, presence: true
  validates :title, :body, presence: true

  belongs_to :user
  has_many :post_comments, dependent: :destroy
end
