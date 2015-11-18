class User < ActiveRecord::Base
  has_many :tweets, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship",
    foreign_key: "follower_id", dependent: :destroy

  # I overrid the default "followed" with "following", because "followeds" in english sounds a bit wrong  
  has_many :following, through: :active_relationships, source: :followed

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
