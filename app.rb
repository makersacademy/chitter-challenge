require 'sinatra/base'
require './lib/peep'
require './lib/user'
require './lib/database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    database_connection_setup
    @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb :peeps
  end

  get '/new' do
    erb :new_peep
  end

  post '/new' do
    # database_connection_setup
    Peep.create(peep: params['peep'])
    redirect '/'
  end

  get '/users/new' do
    erb :registration
  end

  post '/users' do
    # database_connection_setup
    user = User.create(name: params['name'], email: params['email'], password: params['password'])
    session[:user_id] = user.id[0]
    redirect '/'
  end

  get '/login' do
    @error = session[:error]
    erb :login
  end

  post '/login' do
    if
      user = User.authenticate(email: params[:email], password: params[:password])
      session[:user_id] = user.id
      redirect('/')
    else
      session[:error] = 'Incorrect log in details. Please check your email or password.'
      redirect('/login')
    end
  end
end
