class Tweet < ActiveRecord::Base
  belongs_to :user
  validates :tweet_content, presence: true, length: { maximum: 140 }
end
