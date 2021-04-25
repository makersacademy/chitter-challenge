require 'sinatra'
require 'sinatra/reloader'
require './lib/peep'
require './lib/user'
require_relative 'database_connection_setup'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  enable :sessions
  
  get '/' do
    erb(:index)
  end

  get '/chitter' do
    @peeps = Peep.all
    @user_name = session[:user_name]
    erb(:'chitter/home_page')
  end

  get '/chitter/post_peep' do
    erb(:'/chitter/post_peep')
  end

  post '/chitter/post_peep' do
    Peep.create(text: params[:peep], user: params[:user])
    redirect('/chitter')
  end

  get '/user/new' do
    erb :'user/new'
  end

  post '/user' do
    user = User.create(email: params[:email], password: params[:password], name: params[:name])
    session[:user_name] = user.name
    redirect('/chitter')
  end

end
