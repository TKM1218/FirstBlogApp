class TagsController < ApplicationController

  def index
    @tag = ActsAsTaggableOn::Tag.find_by(name: params[:name])
    @tweets = Tweet.tagged_with(@tag.name)
  end

end
