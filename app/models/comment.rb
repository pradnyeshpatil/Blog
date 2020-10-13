class Comment < ApplicationRecord
  belongs_to :post
  
  validates :name, presence: true, length: { maximum: 50 }
  
  validates :body, presence: true, length: { maximum: 5000 }

end
