class SessionsController < ApplicationController
  def new
  end

  def create
    @email = params['email'] #pour le réécrire en cas d'échec
    user = User.find_by(email: params['email'])
    if user
      if user.authenticate(params['password'])
        session[:user_id] = user.id
        flash[:success] = 'Tu es connecté !'
        redirect_to :root
      else
        flash.now[:danger] = 'Mot de passe incorrect'
        render 'new'
      end
    else
      flash.now[:danger] = 'Adresse mail inconnue du site !'
      render 'new'
    end
  end

  def destroy
    session.clear
    redirect_to :root
  end
end
