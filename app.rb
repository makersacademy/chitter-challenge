require 'sinatra/base'
require 'sinatra/reloader'
require './database_connection_setup'

require './lib/sign_up'
require './lib/log_in'

class Chitter < Sinatra::Base 
  configure :development do
    register Sinatra::Reloader
  end
  
  enable :sessions, :method_override
  
  get '/' do
    erb :index
  end

  post '/log-out' do
    session[:logged_in_user] = nil
    redirect '/'
  end

  post '/post-peep' do
    redirect '/'
  end

  get '/sign-up' do
    erb :sign_up
  end

  post '/sign-up' do
    if SignUp.validate(params["username"], params["email"])
      session[:logged_in_user] = User.add_user(email: params["email"], username: params["username"], full_name: params["full_name"], password: params["password"])
      redirect '/'
    else
      redirect '/sign-up' ## TODO: Set up 'username/email already in use' banner
    end
  end

  get '/log-in' do
    erb :login
  end

  post '/log-in' do
    if LogIn.validate(params["email"], params["password"])
      session[:logged_in_user] = User.find_user('email', params["email"])
      redirect '/'
    else
      redirect '/log-in' ## TODO: Set up 'login failed' banner
    end
  end

  run! if app_file == $0
end