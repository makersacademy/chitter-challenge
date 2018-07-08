require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'
require './lib/user'
require './lib/database_connection_setup'


class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

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

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params['email'], params['password'])
    if user
      session[:user_id] = user.id
      redirect("/users/#{user.username}")
    else
      flash[:error] = 'Please check your log in details and try again'
      redirect("/sessions/new")
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/')
  end

  run! if app_file == $0
end
