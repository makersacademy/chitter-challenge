class Chitter < Sinatra::Base

  get '/session/new' do
    erb :'session/new'
  end

  post '/session/new' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
    else
      flash.now[:errors] = ["Log In invalid - plese try again"]
      erb :'session/new'
    end
  end

end
