require 'sinatra/base'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    'Hello World!'
  end

  get '/peeps' do
    @user = User.find(id: session[:user_id])
    @peeps = Peep.all
    erb :'peeps'
  end

  get '/peeps/new' do
    erb :'new'
  end

  post '/peeps/new' do
    Peep.create(author: params[:author], content: params[:content])
    redirect '/peeps'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password], name: params[:name], username: params[:username])
    session[:user_id] = user.id
    redirect '/peeps'
  end

  run! if app_file == $0
end
