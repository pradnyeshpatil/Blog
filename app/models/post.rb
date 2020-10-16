require 'csv'
class Post < ApplicationRecord
  has_rich_text :content
  has_many :comments, dependent: :destroy
  belongs_to :user 
  has_many :ratings
  
  default_scope -> { order(created_at: :desc) }
  validates :title, presence: true, length: { maximum: 100 }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 500 }



  def self.as_csv
    CSV.generate do |csv|
      csv << %w[title content]
      Post.all.each do |post|
        csv << [post.title, post.content.to_plain_text.gsub(',','')] 
      end
    end
  end
end