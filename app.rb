require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  enable :sessions

  get '/' do
    @user = User.find(session[:user_id])
    erb :index
  end

  post '/' do
    redirect '/'
  end

  post '/posts' do
    flash[:notice] = "That's too long, be more concise!" unless \
    Peep.post(peep: params['peep'], user: params['username'])
    redirect '/posts'
  end

  get '/posts' do
    @peeps = Peep.display
    erb :posts
  end

  post '/users/new' do
    redirect '/users/new'
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.create(email: params['email'], password: params['password'], \
                       name: params['name'], username: params['username'])
    session[:user_id] = user.id
    redirect '/'
  end

  run! if app_file == $0
end
