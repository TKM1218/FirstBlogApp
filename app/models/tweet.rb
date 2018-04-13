class Tweet < ActiveRecord::Base

  #acts_as_ordered_taggable_on :types

  #has_and_belongs_to_many :tags
  #accepts_nested_attributes_for :tags, allow_destroy: true, reject_if: :all_blank

  belongs_to :user
  has_many :comments
  has_many :likes, dependent: :destroy

  has_many :tweet_tag_links, dependent: :destroy
  has_many :tags, through: :tweet_tag_links

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

  def save_tags
    array = self.check_taggable_word(self.title)
    self.tag_list.add(array, parse: true)
  end

  def tag_lists
    tag_lists = self.tag_list
  end

  def check_taggable_word(text)
    ary = Array.new
    nm = Natto::MeCab.new
    nm.parse(text) do |n|
      ary<<n.surface
    end
    tags = ActsAsTaggableOn::Tag.pluck(:name)
    return ary & tags
  end

  def add_tag(label)
    self.class.transaction do
      tag = Tag.find_by(value: label)
      tag = Tag.create!(value: label)
      unless
        tweet_tag_links.where(tag_id: tag.id).exists?
        tweet_tag_links.create!(tag_id: tag.id)
      end
    end
  end

  def remove_tag(label)
    self.class.transaction do
      if tag = Tag.find_by(value: label)
        tweet_tag_links.find_by(tag_id: tag.id).destroy
        if tag.tweet_tag_links.empty?
          tag.destroy
        end
      end
    end
  end

end
