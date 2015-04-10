require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chittter_#{env}")

require './lib/user'
require './lib/post'

DataMapper.finalize
DataMapper.auto_upgrade!

class Chittter < Sinatra::Base
  enable :sessions
  use Rack::Flash

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation],
                name: params[:name],
                username: params[:username])
    if user.save
      redirect to('/')
    else
      flash[:errors] = user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
