module Helpers 

  def current_user
    @current_user ||= User.get(session[:user_id])
  end

  def authenticate_user
    User.authenticate(  params[:email],
                        params[:password] )
  end

  def new_chit
    Chit.new( time: Time.now,
              text: params[:chit],
              user_id: current_user.id)
  end

  def new_user
    User.new( email: params[:sign_up_email],
              real_name: params[:real_name],
              user_name: params[:user_name],
              password: params[:sign_up_password],
              password_confirmation: params[:password_confirmation])
  end
end
