ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require './app/models/peep'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    redirect '/posts'
  end

  get '/posts' do
    @peeps = Peep.all
    erb :'posts/view_posts'
  end

  post '/posts/new' do
    Peep.create(title: params[:title], message: params[:message])
    redirect '/posts'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(name: params[:name], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/posts'
  end

  helpers do
     def current_user
       @current_user ||= User.get(session[:user_id])
     end
  end

  run! if app_file== $0

end
