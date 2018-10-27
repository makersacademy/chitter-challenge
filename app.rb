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
    @chitters = Chitter.all
    erb :homepage
  end

  post '/peep' do
    Chitter.add(text: params[:peep], username: 'Becka', peep_time: DateTime.now)
    redirect '/'
  end

  post '/authenticate' do
    successful = User.authenticate(username: params['username'], password: params['password'])
    session[:user_id] = params['username'] if successful
    session[:failed_login] = "Log in unsuccessful" if ! successful
    redirect '/'
  end

  run! if app_file == $0

end
