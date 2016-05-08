module Helpers
  def current_user
    @current_user ||= User.get(session[:user_id])
  end

  def create_user
    @user = User.create(name: params[:name],
    username: params[:user_name],
    email: params[:email],
    password: params[:password],
    password_confirmation: params[:password_confirmation])
  end

  def auth_user
    User.authenticate(params[:email], params[:password])
  end

  def new_peep
    Peep.create(maker: current_user.name,
    user_handle: current_user.username,
    body: params[:body])
  end
end
