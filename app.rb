require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/chitter'
require_relative 'lib/user'

class ChitterChallenge < Sinatra::Base

  set :public, 'public'
  enable :sessions, :method_override

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @user = User.find(id: session[:user_id])
    @peeps = Chitter.peeps
    erb(:index)
  end

  post '/' do
    Chitter.post(message: params[:message])
    @peeps = Chitter.peeps
    redirect '/'
  end

  get '/peeps/new' do
    erb(:"peeps/new")
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/'
  end

  run! if app_file == $0
end