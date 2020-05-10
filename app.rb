require 'sinatra/base'
require './lib/peep'
require './lib/user'
require './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb(:index)
  end

  post '/new-peep' do
    Peep.create(peep: params[:peep], time: 'now')
    redirect '/'
  end

  get '/users-new' do
    erb(:users_new)
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/'
  end

  run! if app_file == $0
end
