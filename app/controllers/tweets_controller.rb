class TweetsController < ApplicationController

  def index
    @tweet = Tweet.new
    @tweets = Tweet.all
  end

  def create
    @tweet = current_user.tweets.new(tweet_params)
    if @tweet.save
      redirect_to tweets_path
    else
      flash[:alert] = 'There was an error posting your message'
      redirect_to tweets_path
    end
  end

  def tweet_params
    params.require(:tweet).permit(:tweet_content)
  end
end
