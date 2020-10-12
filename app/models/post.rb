class Post < ApplicationRecord
  has_rich_text :content
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :title, presence: true, length: { maximum: 100 }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 500 }
end