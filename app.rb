require 'sinatra/base'
require_relative './lib/database_connection'
require_relative './lib/peep'
require_relative './lib/user'
require_relative './database_connection_setup'
require 'date'

class Chitter < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    'Chitter'
  end

  get '/peeps' do
    @user = User.find(id: session[:user_id])
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    Peep.create(text: params['text'], posted_time: (Time.now).strftime("%d/%m/%Y %H:%M"))
    redirect '/peeps'
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.create(name: params['name'], email: params['email'], username: params['username'], password: params['password'])
    session[:user_id] = user.id
    redirect '/peeps'
  end

 run! if app_file == $0
end
