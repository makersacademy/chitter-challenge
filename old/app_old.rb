require 'sinatra/base'
require 'sinatra'
require 'sinatra/activerecord'
require './lib/peep'
require './lib/user'
require 'sinatra/flash'
require './database_connection_setup'
require 'date'


class ChitterApp < Sinatra::Base

  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  post '/login' do
    session[:username] = params[:username]
    redirect '/peeps'
  end

  get '/peeps' do
    @user = User.find(id: session[:userid])
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    @user = User.find(id: session[:userid])
    @peeps = Peep.all
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(userid: session[:username], content: params[:content])
    redirect '/peeps'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(grip: params[:grip], name: params[:name], email: params[:email], password: params[:password])
    session[:userid] = user.id
    redirect '/peeps'
  end

  run! if app_file == $0
end