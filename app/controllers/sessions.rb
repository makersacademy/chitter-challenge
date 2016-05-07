class Chitter < Sinatra::Base

  get '/session/new' do
    erb :'/session/new'
  end

  post '/session/new' do
    user = User.authenticate(params[:user_name],
                             params[:password])
    if user
      session[:user_id] = user.id
      redirect '/'
    else
      flash.now[:errors] = "username or password did not match"
      erb :'/session/new'
    end
  end

  delete '/session' do
    session[:user_id] = nil
    redirect '/session/new'
  end

end
