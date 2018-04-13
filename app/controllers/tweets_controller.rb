class TweetsController < ApplicationController

  before_action :move_to_index, except: :index
  respond_to :js, :jscs, :html

  def index
    @tweets = Tweet.includes(:user).page(params[:page]).per(5).order("created_at DESC")
    #@tweet.tag_list.add("awesome", "slick")
    #@tweet.tag_list.remove("awesome","slick")
    #tweet.tag_list.add("天気,スポーツ")
    #tweet.tag_list.remove("天気,スポーツ")
    #model.find_related_skill
              #tweet.tag_list.add("天気")
              #tweet.save
              #tweet.label_list
              #tweet.tag_list
              #tweet.tag_list = ["天気"]
              #tweet.tag_list.remove("天気")
  end

  def new

  end

  def create
    Tweet.create(image: tweet_params[:image], text: tweet_params[:text], user_id: current_user.id)
  end

  def destroy
      tweet = Tweet.find(params[:id])
      tweet.destroy if tweet.user_id == current_user.id
  end

  def tag
    tweet = Tweet.find(params[:id])
    tweet.add_tag(params[:label])
    tweet.remove_tag(params[:label])
      render text: 'OK'
  end

  def show
    @tweet = Tweet.find(params[:id])
    #@blogapp = Blogapp.find(params[:id])
    @comments = @tweet.comments.includes(:user)
    @likes_count = Like.where(tweet_id: @tweet.id).count
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def like
    @current_user = User.first
    @tweet = Tweet.find(params[:id])
    @current_user.flag(@tweet, :like)
    redirect_to tweets_path
  end

private
    def tweet_params
      params.require(:tweet).permit(:image, :text, :types_list)
    end

    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end

end
