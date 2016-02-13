class Chitter < Sinatra::Base

  get '/users/forgot-password' do
    erb :'/users/forgot_password'
  end

  get '/users/token-verification' do
    erb :'/users/token_verification'
  end

  get '/users/reset-password' do
    erb :'/users/reset_password'
  end

  post '/users/send-token' do
    user = User.first(email: params[:email])
    user.forgot_password if user
    notice = "If the email exists, it will receive password reset instructions"
    notice_redir(notice: notice, redirection: '/users/login')
  end

  post '/users/token-verification' do
    user = User.first(password_token: params[:token])
    if user && !user.expired_token?
      session[:token] = params[:token]
      redirect '/users/reset-password'
    else
      notice_redir(notice: "Invalid token", redirection: '/users/token-verification')
    end
  end

  post '/users/reset-password' do
    user = User.first(password_token: session[:token])
    success = user.update_password(params[:password], params[:password_confirmation]) if user
    if success
      user.destroy_token
      session.clear
      notice_redir(notice: "Password has been reset", redirection: '/users/login')
    else
      notice_redir(notice: "Try again", redirection: '/users/reset-password')
    end
  end

end
