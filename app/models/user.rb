class User < ActiveRecord::Base
  has_many :tweets, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
