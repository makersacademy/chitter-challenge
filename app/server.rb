require 'data_mapper'
require 'sinatra'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/blabber_#{env}")

require_relative 'models/blabbs'
require_relative 'models/user'

DataMapper.finalize

DataMapper.auto_upgrade!

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
  User.create(name: params[:name],
              username: params[:username],
              email: params[:email],
              password: params[:password])
  redirect to('/')
end
