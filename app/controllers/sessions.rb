# Controllers for sessions path
class Chitter < Sinatra::Base
  get '/sessions/new' do
    session[:user_id] = nil
    erb(:'/sessions/new')
  end

  post '/sessions' do
    @user = User.authenticate(params[:email_or_username], params[:password])
    if @user
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      flash.now[:errors] = ['The email/username or password is incorrect']
      erb(:'/sessions/new')
    end
  end
end
