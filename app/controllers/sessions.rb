class Chitter < Sinatra::Base

  get '/sessions/new' do
    @user = User.new
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      "Welcome #{user.first_name}!"
    else
      flash.now[:error] = ['Login details do not match :(']
      erb :'/sessions/new'
    end
  end

end
