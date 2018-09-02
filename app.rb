require 'sinatra/base'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/peep' do
    peep = params[:peep]
    Peep.create(peep)
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :chit
  end

  get '/peeps_reverse' do
    @reverse_peep = Peep.reverse
    erb :reverse
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    email = params[:email]
    password = params[:password]
    session[:user] = User.create(email, password)
    redirect '/user/index'
  end

  get '/user/index' do
    @user = session[:user]
    erb :"users/index"
  end

  run! if app_file == $0
end
