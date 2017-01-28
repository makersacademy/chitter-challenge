class Chitter < Sinatra::Base

  get '/sessions/new' do
    slim :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/'
    else
      flash.now[:notice] = ["The email or password entered is incorrect"]
      slim :'sessions/new'
    end
  end

  get '/' do
    # slim :index
  end

end
