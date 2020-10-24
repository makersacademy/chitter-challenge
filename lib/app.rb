require 'sinatra/base'
require_relative './model/peep'
require_relative './model/user'


class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb(:index)
  end

  get '/home' do
    @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb(:'/home')
  end

  post '/peep' do
    Peep.create(peep: params[:newpeep])
    redirect '/home'
  end

  get '/users/new' do
    erb(:'users/new')
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/home'
  end

end
