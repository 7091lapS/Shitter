require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many :tweets}
  it { is_expected.to have_many :active_relationships}
  it { is_expected.to have_many :following}
  it { is_expected.to have_many :passive_relationships}
  it { is_expected.to have_many :followers}

  it "should follow and unfollow users" do
    bernie = create(:user)
    hillary = create(:user)
    expect(bernie.following?(hillary)).to eq(false)
    bernie.follow(hillary)
    expect(hillary.followed_by?(bernie)).to eq(true)
    expect(bernie.following?(hillary)).to eq(true)
    bernie.unfollow(hillary)
    expect(bernie.following?(hillary)).to eq(false)
  end
end
