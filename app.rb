require 'sinatra/base'
require './lib/peeps'
require './lib/users'

class Chitter < Sinatra::Base
  enable :sessions

  get '/chitter' do
    @peeps = Peeps.all
    erb :chitter
  end

  post '/chitter' do
    Peeps.add(body: params['post'])
    redirect '/chitter'
  end

  get '/users/signup' do
    erb :'/users/signup'
  end

  post '/users/new' do
    @new_user = Users.sign_up(username: params['username'], email: params['email'], password: params['password'])
    sessions[:user_id] = user.id
    redirect '/chitter'
  end


  #   get '/users/login' do
  #   erb :'/users/login'
  # end

  run! if app_file == $0
end
