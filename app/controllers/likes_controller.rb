class LikesController < ApplicationController
  before_action :authenticate_user

  def authenticate_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_back(fallback_location: root_path)
    end
  end

  def create
    Like.create(
      user: current_user,
      gossip: Gossip.find(params['gossip_id'])
    )
    redirect_back(fallback_location: root_path)
  end

  def destroy
    Like.find_by(
      gossip_id: params['gossip_id'],
      user_id: current_user.id
    ).destroy
    redirect_back(fallback_location: root_path)
  end
end
