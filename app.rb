require 'sinatra/base'
require './lib/chitter'
require './lib/user'

class ChitterChatter < Sinatra::Base
  enable :sessions

  get '/' do
    @user = User.find(id: session[:user_id])
    @peeps = Chitter.all
    erb :index
  end

  post '/' do
    peep = params['new_peep']
    Chitter.add(peep)
    redirect '/'
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.create(email: params['email'], password: params['password'])
    session[:user_id] = user.id
    redirect '/'
  end

  run! if app_file == $0

end
