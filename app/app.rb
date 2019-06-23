require 'sinatra/base'
require './lib/database_connection_setup'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    redirect :'/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/all'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    user_id = session[:user_id]
    Peep.create(text: params['text'], user_id: user_id )
    redirect '/peeps'
  end

  get '/user/new' do
    erb :'user/new'
  end

  post '/user' do
    @user = User.create(name: params['name'],
              username: params['username'],
              email: params['email'],
              password: params['password'])
    session[:user_id] = @user.id
    redirect :"/peeps"
  end

  run! if app_file == $0
end
