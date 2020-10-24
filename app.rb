require 'sinatra/base'
require './lib/peep'
require 'pg'
require './lib/user'

class Chitter < Sinatra::Base
  enable :sessions

  get '/chitter' do
    @peeps = Peep.all
    @user = User.find(session[:id]) if session[:id]
    erb :'chitter/index'
  end

  get '/chitter/peep/new' do
    erb :'chitter/peep/new'
  end

  post '/chitter' do
    Peep.create(params[:peep])
    redirect to '/chitter'
  end

  get '/users/new' do
    erb :'chitter/users/new'
  end

  post '/users' do
    user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    session[:id] = user.id
    redirect to '/chitter'
  end

end
