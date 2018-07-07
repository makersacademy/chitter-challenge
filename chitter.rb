require 'sinatra/base'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/' do
    Peep.create(comment: params['comment'], user_id: params['user_id'])
    redirect("/users/#{params['username']}")
  end

  get '/users/new' do
    erb :'/users/new'
  end

  post '/users' do
    user = User.create(name: params['name'], username: params['username'], email: params['email'], password: params['password'])
    session[:user_id] = user.id
    redirect("/users/#{params['username']}")
  end

  get '/users/:username' do
    @peeps = Peep.all
    @user = User.find(session[:user_id])
    erb :'users/index'
  end

  run! if app_file == $0

end
