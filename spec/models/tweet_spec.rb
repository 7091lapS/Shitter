require 'rails_helper'

RSpec.describe Tweet, type: :model do

  it {is_expected.to belong_to :user}

  it 'is not valid if longer than 140' do
    long_tweet = Tweet.new(tweet_content: "this is message is looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooonger than 140 characters")
    expect(long_tweet).not_to be_valid
  end

  it 'is not valid is empty' do
    empty_tweet = Tweet.new(tweet_content: "    ")
    expect(empty_tweet).not_to be_valid
  end

end
