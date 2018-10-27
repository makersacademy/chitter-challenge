require 'sinatra/base'
require './lib/peep'
require './lib/user'
require './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @peeps = Peep.all
    @user = session[:current_user]
    erb :index
  end

  get '/sign-up' do
    erb :sign_up
  end

  post '/new-user' do
    session[:current_user] = User.register(username: params['username'], password: params['password'])
    redirect '/'
  end

  post '/post' do
    Peep.post(params['peep_content'])
    redirect '/'
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    session[:current_user] = User.find(username: params['username'], password: params['password'])
    redirect '/'
  end

  get '/logout' do
    session.delete(:current_user)
    redirect '/'
  end

  run! if app_file == $0
end
