require 'sinatra/base'
require './DatabaseConnection_setup'
require './lib/Peep'
require './lib/User'


class ChitterApp < Sinatra::Base
  run! if app_file == $0

  enable :sessions

  get '/' do
    @user = User.retrieve(user_id: session[:user_id])
    @peeps = Peep.retrieve_multiple_peeps(limit: 20)
    erb(:index)
  end

  post '/' do
    message = params['peep']
    user_id = session[:user_id].to_s
    Peep.create(message: message, user_id: user_id)
    redirect '/'
  end

  get '/signup' do
    erb(:signup)
  end

  post '/signup' do
    handle = params['handle']
    display_name = params['display_name']
    email = params['email']
    password = params['password']
    user = User.create(handle: handle, display_name: display_name, email: email, password: password)
    session[:user_id] = user.user_id
    redirect '/'
  end

  get '/login' do
    erb(:login)
  end

  post '/login' do
    handle = params['handle']
    password = params['password']
    user = User.authenticate(handle: handle, password: password)

    if user
      session[:user_id] = user.user_id
      redirect '/'
    else
      redirect '/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

end
