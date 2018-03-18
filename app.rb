require_relative './lib/peep'
require_relative './lib/user'
require 'sinatra/base'
require 'sinatra/flash'
require './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb(:login)
  end

  get '/signup' do
    erb(:signup)
  end

  post '/signup' do
    signed_up = User.add(params[:txt_username], params[:txt_pwd],
      params[:txt_first_name], params[:txt_last_name], params[:txt_email])
    if !signed_up
      flash[:error] = 'Error signing up, username taken.'
      redirect('/signup')
    else
      flash[:success] = 'Sign up successful, please sign in.'
      redirect('/')
    end
  end

  post '/login' do
    logged_in = User.login(params[:txt_username], params[:txt_pwd])
    !logged_in ? flash[:error] = 'Invalid username or password' : redirect('/peeps')
    redirect('/')
  end

  get '/peeps' do
    @peeps = Peep.show_all
    erb(:index)
  end

  post '/add' do
    Peep.add(1, params[:tb_peep])
    redirect('/peeps')
  end
  run! if app_file == $0
end
