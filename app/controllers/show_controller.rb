class ShowController < ApplicationController
  def gossip
    @gossip = Gossip.find(params['id'].to_i)
  end

  def user
    @user = User.find(params['id'].to_i)

  end
end
