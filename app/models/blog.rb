class Blog < ApplicationRecord

  attachment :image
  validates :image, presence: true
  validates :title, :body, presence: true

end
