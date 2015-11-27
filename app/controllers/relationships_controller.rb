class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    user_to_follow = User.find(params[:followed_id])
    current_user.follow(user_to_follow)
    redirect_to user_to_follow

  end

  def destroy
    user_to_unfollow = Relationship.find(params[:id]).followed
    current_user.unfollow(user_to_unfollow)
    redirect_to user_to_unfollow
  end
end
