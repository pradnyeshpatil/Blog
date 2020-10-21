class AddRequiredTimeToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :required_time, :float,
  end
end
