require 'sinatra'
require 'sinatra/base'
require './lib/peeps'
require './lib/users'
require './database_connection_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @peeps = Peeps.all
    erb(:index)
  end

  get '/post-peep' do
    erb (:post_a_peep)
  end

  post '/process-peep' do
    Peeps.post(peep: params['peep'], uid: params['uid'])
    redirect '/'
  end

  get '/register' do
    erb (:sign_up)
  end

  post '/add-user' do
    Users.register(name: params['name'], email: params['email'], username: params['username'], password: params['password'])
    redirect '/show-users'
  end

  get '/show-users' do
    @users = Users.all
    erb(:show_users)
  end

  run! if app_file == $0
end
