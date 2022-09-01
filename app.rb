require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'docs/peep'
require_relative 'docs/user'
require 'pg'



class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions, :method_override

  get '/' do
    erb :index
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/new_peep' do
    Peep.create(content: params[:new_peep])
    redirect '/peeps/index'
  end

  get '/peeps/index' do
    @user = User.find(session[:user_id])
    @peeps = Peep.view_peeps
    erb :'peeps/index'
  end

  get '/users/new' do
    erb :"users/new"
  end
  
  post '/users' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/peeps/index'
  end
end