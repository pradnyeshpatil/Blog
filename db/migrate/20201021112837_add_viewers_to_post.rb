class AddViewersToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :viewers, :integer, default: 0
  end
end
