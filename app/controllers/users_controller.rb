class UsersController < ApplicationController
  def show
    @user = User.find(params['id'].to_i)
    @title = @user.first_name
  end
end
