class AddPostToRatings < ActiveRecord::Migration[6.0]
  def change
    add_reference :ratings, :post
  end
end
