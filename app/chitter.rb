ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require './app/data_mapper_setup'
require './app/models/peep'
require './app/models/user'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super_secret'

  get '/' do
    redirect :'/users/new'
  end

  get '/peeps/new' do
    erb :'/peeps/new'
  end

  post '/peeps' do
    Peep.create(peep: params[:peep], user: params[:user])
    redirect :'/peeps'
  end

  get '/peeps' do
    @all_peeps = Peep.all
    erb :'peeps/index'
  end

  get '/users/new' do
    @user = User.new
    erb :'/users/new'
  end

  post '/users' do
    user = User.create(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect '/peeps/new'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end 
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
