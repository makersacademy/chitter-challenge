require 'sinatra/base'
require 'sinatra/flash'
require './database_connection_setup'
require_relative './controllers/users_controller'
require_relative './controllers/peeps_controller'
require_relative './lib/maker'
require_relative './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash
  use UsersController
  use PeepsController

  get '/' do
    'Hello, World!'
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    maker = Maker.authenticate(
      email: params[:email],
      password: params[:password]
    )
    if maker
      session[:maker_id] = maker.id
      redirect('/peeps')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/sessions/new')
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/peeps')
  end

  run! if app_file == $0
end
