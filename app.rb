require 'sinatra/base'
require 'sinatra/reloader'
require './lib/user'
require './lib/peep'
require './database_connection_setup'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload './lib/peep'
    also_reload './lib/user'
  end

  enable :sessions

  get '/peeps' do
    @user = User.find(session[:user_id])
    @peeps = Peep.show
    erb(:peeps)
  end

  post '/peeps' do
    Peep.create(params[:peep])
    redirect '/peeps'
  end

  get '/users/new' do
    erb(:'users/new')
  end

  post '/users' do
    user = User.create(
      name: params[:name], username: params[:username], 
      email: params[:email], password: params[:password]
    )
    session[:user_id] = user.id
    redirect './peeps'
  end
end
