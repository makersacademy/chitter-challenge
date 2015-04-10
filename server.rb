require 'sinatra/base'
require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chittter_#{env}")

require './lib/user'
require './lib/post'

DataMapper.finalize
DataMapper.auto_upgrade!

class Chittter < Sinatra::Base
  get '/' do
    'Hello Chittter!'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/new_user' do
    User.create(email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation],
                name: params[:name],
                username: params[:username])
    erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
