module Helpers

  def current_user 
    @current_user ||= User.get(session[:user_id])
  end

  def new_peep
    Peep.create(
      content: params[:peep], 
      time: time,
      user: current_user.username
    )
  end

  def new_user
    User.create(
      name: params[:name],
      username: params[:username],
      email: params[:email],
      password: params[:password], 
      password_confirmation: params[:password_confirmation]
      )
  end

end