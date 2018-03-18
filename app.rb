require './database_connection_setup'
require './lib/peep'
require 'sinatra/base'
require 'sinatra/flash'
require './lib/user'

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    session[:username] = 'anonymous'
    redirect '/chitter'
  end

  get '/chitter' do
    @welcome_msg = "Welcome, #{session[:username]}!"
    @peeps = Peep.all
    erb :'chitter/index'
  end

  post '/chitter/add_peep' do
    Peep.add(params[:new_peep_text], session[:username])
    redirect '/chitter'
  end

  get '/chitter/sign_up' do
    erb :'chitter/sign_up'
  end

  post '/chitter/apply_sign_up' do
    session[:username] = params[:username]
    redirect '/chitter'
  end

  get '/chitter/sign_in' do
    erb :'chitter/sign_in'
  end

  post '/chitter/apply_sign_in' do
    msg = User.sign_in(params['email'], params['password'])
    if msg
      flash[:notice] = msg
      redirect '/chitter/sign_in'
    else
      session[:username] = User.current_user.username
      redirect '/chitter'
    end
  end

  run! if app_file == $0

end
