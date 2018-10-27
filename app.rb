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

# TODO make this take name of user

  post '/peep' do
    if session[:user_id].nil?
      session[:peep_error] = "You must log in to peep"
    else
      Chitter.add(text: params[:peep],
                  username: 'Becka',
                  peep_time: DateTime.now)
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

  post '/logout' do
    session[:user_id] = nil
    redirect '/'
  end

  run! if app_file == $0

end
