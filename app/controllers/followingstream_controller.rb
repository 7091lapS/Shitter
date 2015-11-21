class FollowingstreamController < ApplicationController
  before_action :authenticate_user!

  def index
    @tweet = Tweet.new
    @tweets = []
    current_user.following.each do |user|
      user.tweets.each do |tweet|
        @tweets << tweet
      end
    end
  end

  def create
    @tweet = current_user.tweets.new(tweet_params)
    if @tweet.save
      redirect_to tweets_path
    elsif @tweet.tweet_content.length > 140
      flash[:alert] = 'Max post length is 140 characters'
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
