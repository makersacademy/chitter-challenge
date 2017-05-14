
class Chitter < Sinatra::Base
  get '/signup' do
    @user = User.new
    erb(:signup)
  end

  post '/signup' do
    @user = User.create(user_paramaters)
    if @user.save
      user_login_success
    else
      flash.now[:signup_errors] = @user.errors.full_messages
      erb(:signup)
    end
  end

  get '/login' do
    erb(:login)
  end

  post '/login' do
    @user = User.authenticate(params[:email], params[:password])
    if @user
      user_login_success
    else
      flash.now[:login_error] = 'Invalid login details'
      erb(:login)
    end
  end

  delete '/logout' do
    session[:user_id] = nil
    flash.keep[:notice] = 'You logged out!'
    redirect '/home'
  end
end
