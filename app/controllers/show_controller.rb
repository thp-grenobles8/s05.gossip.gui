class ShowController < ApplicationController
  # def gossip
  #   @gossip = Gossip.find(params['id'].to_i)
  #   @title = @gossip.title
  # end

  def user
    @user = User.find(params['id'].to_i)
    @title = @user.first_name
  end
end
