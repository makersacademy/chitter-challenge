class Chitter < Sinatra::Base
  get '/sign_in' do
    erb :'session/new'
  end

  post '/check_sign_in' do
    user = authenticate_user(params)
    redirect "/user/#{user.username}" if user
    session[:errors] = ["Invalid email or password"] 
    erb :'session/new'
  end

  delete '/sign_out' do
    session.clear
    flash.keep[:notice] = "You have signed out"
    redirect '/'
  end
end
