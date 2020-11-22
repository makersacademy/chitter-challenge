require 'sinatra/base'
require 'pg'
require_relative './lib/peep'
require_relative './lib/user'

class Chitter < Sinatra::Base
  enable :sessions
  get '/' do
    @peeps = Peep.all
    @welcome_message = session[:name] ? "Welcome #{name}" : ""
    erb :index
  end

  get '/post_peep' do
    erb :'post_peep'
  end

  post '/post_peep' do
    Peep.add(params[:peep])
    redirect '/'
  end

  get '/users/new' do
    erb :"users_new"
  end

  post '/users/new' do
    user = User.create(name: params[:name],
      username: params[:username],
      email: params[:email],
      password: params[:password])
    session[:name] = user.name
    session[:username] = user.username
    redirect '/'
  end

  run! if app_file == $0
end
