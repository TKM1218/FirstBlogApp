class Tag < ActiveRecord::Base

  has_many :tweet_tag_links, dependent: :destroy
  has_many :tweets, through: :tweet_tag_links

end
