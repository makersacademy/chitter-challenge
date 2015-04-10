require 'data_mapper'
require 'sinatra'

require_relative 'models/blabbs'
require_relative 'models/user'

require_relative 'helpers/application'
require_relative 'data_mapper_setup'

enable :sessions
set :session_secret, 'super secret'

get '/' do
  @blabbs = Blabbs.all
  erb :index
end

post '/blabbs' do
  message = params['message']
  Blabbs.create(message: message)
  redirect to('/')
end

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  user = User.create(name: params[:name],
                     username: params[:username],
                     email: params[:email],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation])
  session[:user_id] = user.id
  redirect to('/')
end
