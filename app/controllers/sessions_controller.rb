class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      reset_session
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'The email or password you entered is incorrect.'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
