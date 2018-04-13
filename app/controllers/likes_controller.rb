class LikesController < ApplicationController

  def create
    @like = Like.create(user_id: current_user.id, tweet_id: params[:tweet_id])
    @likes = Like.where(tweet_id: params[:tweet_id])
    @tweet = Tweet.find(params[:tweet_id])
    @tweets = Tweet.all
    @like.save
    redirect_to("/tweets")

    #@tweet = Tweet.find(params[:tweet_id])
    #@like = @tweet.likes.create(user_id: current_user.id)
    #@likes = @tweet.liles
    #@tweets = Tweet.all
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, tweet_id: params[:tweet_id])
    like.destroy
    @likes = Like.where(tweet_id: params[:tweet_id])
    @tweet = Tweet.find(params[:tweet_id])
    @tweets = Tweet.all
    redirect_to("/tweets")

    #@tweet = Tweet.find(params[:tweet_id])
    #like = @tweet.likes.find_by(user_id: current_user_id)
    #like.destroy
    #@likes = @tweet.likes
    #@tweets = Tweet.all
  end

end
