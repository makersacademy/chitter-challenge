require 'sinatra'
require 'data_mapper'
require './lib/peep'
require './lib/user'
require_relative 'helpers/application'
require_relative 'data_mapper_setup'

enable :sessions
set :session_secret, 'super secret'

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  user = User.create(email: params[:email],
              password: params[:password])
  session[:user_id] = user.id
  redirect to('/')
end
