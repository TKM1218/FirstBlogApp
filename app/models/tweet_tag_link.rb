class TweetTagLink < ActiveRecord::Base

  belongs_to :tweet
  belongs_to :tag

end
