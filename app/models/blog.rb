class Blog < ApplicationRecord

  attachment :image
  validates :image, presence: true
  validates :title, :body, presence: true

  belongs_to :user, optional: true
  has_many :comments, dependent: :destroy
end
