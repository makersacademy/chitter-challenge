

class Chitter < Sinatra::Base

  use Rack::Flash
  enable :sessions

  get "/sessions/new" do
    erb :'sessions/new'
  end

  post "/sessions" do
    @user = User.authenticate(params[:email], params[:password])
  if @user
    session[:user_id] = user.id
    redirect to('/links')
  else
    flash.now[:errors] = ['Email or password is wrong']
    erb :'sessions/new'
  end
  end


end
