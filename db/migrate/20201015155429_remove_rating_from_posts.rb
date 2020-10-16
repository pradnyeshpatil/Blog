class RemoveRatingFromPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :rating, :integer
  end
end
