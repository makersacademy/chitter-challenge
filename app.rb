require './database_connection_setup'
require './lib/peep'
require 'sinatra/base'
require 'sinatra/flash'
require './lib/user'

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect '/chitter'
  end

  get '/chitter' do
    session[:username] = User.current_user ? User.current_user.username : 'anonymous'
    @sign_out_enabled = User.current_user
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
    fail_msg = User.sign_in(params['email'], params['password'])
    if fail_msg
      flash[:notice] = fail_msg
      redirect '/chitter/sign_in'
    else
      session[:username] = User.current_user.username
      redirect '/chitter'
    end
  end

  run! if app_file == $0

end
