module SessionsHelper

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    else
      false
    end
  end

  def logged_in?
    if session[:user_id]
      true
    else
      false
    end
  end

  def log_in(user)
    session[:user_id] = user.id
  end

end
