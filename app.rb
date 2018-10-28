require 'sinatra/base'
require 'rack'
require './lib/chitter'
require 'time'
require './lib/user'
require 'sinatra/flash'

class App < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    @user = session[:user_id]
    flash[:notice] = session[:failed_login]
    flash[:alert] = session[:peep_error]
    @chitters = Chitter.all
    erb :homepage
  end

  post '/peep' do
    if session[:user_id].nil?
      session[:peep_error] = "You must log in to peep"
    else
      Chitter.add(text: params[:peep],
                  username: session[:user_id],
                  peep_time: Time.now)
    end
    redirect '/'
  end

  post '/authenticate' do
    successful = User.authenticate(username: params['username'],
                                  password: params['password'])
    session[:user_id] = params['username'] if successful
    session[:failed_login] = "Log in unsuccessful" unless successful
    redirect '/'
  end

  get '/user_id' do
    @chitters = Chitter.all
    @username = session[:user_id]
    erb :user_page
  end

  post '/logout' do
    session[:user_id] = nil
    redirect '/'
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    User.add(username: params['username'],
                    email: params['email'],
                    password: params['password'])
    session[:user_id] = params['username'] # if added
    # session[:failed_login] = 'username or email already taken' unless added
    redirect '/'
  end

  run! if app_file == $0

end
