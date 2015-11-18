require 'rails_helper'

RSpec.describe Relationship, type: :model do
  it {is_expected.to belong_to :follower}
  it {is_expected.to belong_to :followed}
end
