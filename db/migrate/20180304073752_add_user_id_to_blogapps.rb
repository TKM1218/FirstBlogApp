class AddUserIdToBlogapps < ActiveRecord::Migration
  def change
    add_column :blogapps, :user_id, :integer
  end
end
