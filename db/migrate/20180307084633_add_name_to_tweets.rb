class AddNameToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :name, :string
    add_column :tweets, :text, :text
    add_column :tweets, :image, :text
  end
end
