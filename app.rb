require 'sinatra/base'
require 'sinatra/flash'
require_relative 'database_connection_setup'
require_relative './lib/peep'
require_relative './lib/user'

class Chitter < Sinatra::Base
  enable :sessions
  set :public_folder, proc { File.join(root, 'static') }

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps' do
    Peep.create(content: params[:peep])
    redirect '/peeps'
  end

  get '/users/new' do
    erb :'/users/new'
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password], name: params[:name],
                       username: params[:username])
    session[:user_id] = user.id
    redirect '/peeps'
  end

  post '/sessions' do
    user = User.authenticate(username: params[:username], password: params[:password])

    session[:user_id] = user.id
    redirect '/peeps'
  end

  run! if app_file == $0
end
