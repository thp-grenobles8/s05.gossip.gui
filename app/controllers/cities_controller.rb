class CitiesController < ApplicationController
  def show
    @city = City.find(params['id'].to_i)
    @title = @city.name
  end
end
