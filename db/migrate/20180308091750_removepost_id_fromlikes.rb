class RemovepostIdFromlikes < ActiveRecord::Migration
  def change
    remove_column :likes, :post_id, :integer
  end
end
