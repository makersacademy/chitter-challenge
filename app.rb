require 'sinatra/base'
require 'sinatra/reloader'
require './database_connection_setup'

class Chitter < Sinatra::Base 
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions, :method_override

  get '/sign-up' do
    erb :sign_up
  end

  post '/sign-up' do
    if SignUp.validate(params["username"], params["email"])
      User.add_user(email: params["email"], username: params["username"], full_name: params["full_name"], password: params["password"])
      session[:logged_in] = true
      redirect '/'
    else
      session[:failed_sign_up]
    end
  end

  get '/' do
    if session[:logged_in] == true
      erb :index
    else
      redirect '/log-in'
    end
  end

  run! if app_file == $0
end