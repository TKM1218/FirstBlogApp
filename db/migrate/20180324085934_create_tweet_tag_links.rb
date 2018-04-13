class CreateTweetTagLinks < ActiveRecord::Migration
  def change
    create_table :tweet_tag_links do |t|
      t.references :tweet, null: false
      t.references :tag, null: false

      t.timestamps null: false
    end

    add_index :tweet_tag_links, [:tweet_id, :tag_id], unique: true
  end
end
