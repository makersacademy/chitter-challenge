require 'sinatra/base'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/user/peep' do
    peep = params[:peep]
    Peep.create(peep)
    redirect '/peeps'
  end

  get '/peeps' do
    @user = session[:user]
    @peeps = Peep.all
    erb :"users/index"
  end

  get '/peeps_reverse' do
    @reverse_peep = Peep.reverse
    @user = session[:user]
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
    @peeps = Peep.all
    erb :"users/index"
  end

  run! if app_file == $0
end
