require 'sinatra/base'
require_relative './lib/peep'
require_relative './lib/user'
require_relative 'lib/database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions # :method_override,

  get '/' do
    @user = User.get(session[:user_id])
    @peeps = Peep.all(:order => [:creation_time.desc])
    erb :index
  end

  post '/peep' do
    user = User.get(session[:user_id])
    Peep.create(content: params[:peep], creation_time: Time.now, user: user)
    redirect '/'
  end

  get '/users/new' do
    erb :signup
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password], name: params[:name], username: params[:username])
    session[:user_id] = user.id
    redirect '/'
  end

  run! if app_file == $0
end
