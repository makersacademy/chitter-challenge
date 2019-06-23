require 'sinatra/base'

class ChitterApp < Sinatra::Base
  enable :sessions
  get '/' do
    erb :homepage
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    session[:current_user] = User.create(
      name: params[:name],
      username: params[:username],
      password: params[:password],
      email: params[:email]
    )
    redirect '/'
  end
  
  run! if app_file == $0
end
