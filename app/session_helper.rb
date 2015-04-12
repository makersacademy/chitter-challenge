module SessionHelper

  def create_session(user)
    session[:user] = user.id
    session[:name] = user.name.split.first
    flash.now[:announcement] = ["Welcome #{session[:name]}!"]
  end

end
