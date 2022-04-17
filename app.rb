require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peep'
require_relative './lib/user'
require_relative './database_connection_setup'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    erb(:index)
  end

  get '/peeps' do
    @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb(:'peeps/index')
  end

  get '/peeps/new' do
    erb(:'peeps/new')
  end

  post '/peeps' do
    Peep.post(peep: params[:peep])
    redirect '/peeps'
  end

  get '/users/new' do
    erb(:'users/new')
  end

  post '/users' do
    user = User.create(
      email: params[:email],
      password: params[:password],
      name: params[:name],
      username: params[:username]
    )
    session[:user_id] = user.id
    redirect '/peeps'
  end

  get '/sessions/new' do
    erb(:'sessions/new')
  end

  post '/sessions' do
    result = DatabaseConnection.query( "SELECT * FROM users WHERE email = $1;", [params[:email]] )
    user = User.new(id: result[0]['id'], email: result[0]['email'], name: result[0]['name'], username: result[0]['username']) 
    session[:user_id] = user.id
    redirect '/peeps'
  end

end
