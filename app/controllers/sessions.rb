
class Chitter < Sinatra::Base

  get '/' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    @email = params[:email]
    if user
      session[:user_id] = user.id
      flash.keep[:notice] = nil
      redirect '/posts/view'
    else
      flash.now[:errors] = ["Wrong Sign In Details! Try Again!"]
      erb :'/sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Signed out!'
    redirect to '/'
  end

end