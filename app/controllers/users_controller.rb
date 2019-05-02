class UsersController < ApplicationController

  def show
    @user = User.find(params['id'].to_i)
    @title = @user.first_name
  end

  def create
    # gestion des villes
    city = City.find_by(name: params['user_city_name'])
    if !city
      city = City.create!(name: params['user_city_name'])
      flash[:info] = "Ta ville n'existait pas, on l'a rajoutée !"
    end

    @user = User.new(
      first_name: params[:user_first_name],
      last_name: params[:user_last_name],
      description: params[:user_desciption],
      email: params[:user_email],
      age: params[:user_age],
      password: params[:user_password],
      password_confirmation: params[:user_password_2],
      city: city
    )
    if @user.save
      flash[:success] = "Bienvenue sur po-potins !"
      log_in(@user)
      redirect_to :root
    else
      flash[:danger] = "Tu n'a pas bien rempli les champs ! \n"+
        @user.errors.full_messages.to_s
      render :new
    end
  end

  def new

  end

end
