class DynamicController < ApplicationController
  def welcome
    @title = "salut !"
    @user_name = params['name']
  end
end
