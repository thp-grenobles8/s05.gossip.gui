class SessionsController < ApplicationController
  def new
  end

  def create
    @email = params['email'] #pour le réécrire en cas d'échec
    user = User.find_by(email: params['email'])
    if user
      if user.authenticate(params['password'])
        log_in user
        flash[:success] = 'Tu es connecté !'
        if params['remember_me']
          remember(user)
          flash['info'] = 'On se souviendra de toi tkt'
        else
          forget(user)
        end
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
    log_out if logged_in?
    redirect_to :root
  end
end
