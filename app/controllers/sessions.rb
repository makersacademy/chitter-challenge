class Chitter < Sinatra::Base
  get '/sessions/new' do
    if current_user
      erb :home
    else
      erb :'sessions/new'
    end
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      erb :home
    else
      flash.now[:error] = ['Login details do not match :(']
      erb :'/sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.now[:notice] = ['Goodbye!']
    erb :home
  end
end
