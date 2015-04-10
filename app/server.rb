require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'
require_relative 'models/data_mapper_setup'
DataMapper.auto_upgrade!
class Chitter < Sinatra::Base
  use Rack::Flash
  use Rack::MethodOverride
  enable :sessions
  get '/' do
    @user = User.first(id: session[:id])
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users/new' do
    email = params[:email]
    username = params[:username]
    password = params[:password]
    password_confirm = params[:password_confirm]
    @user = User.new(email: email,
                     username: username,
                     password: password,
                     password_confirmation: password_confirm)
    if @user.save
      session[:id] = @user.id
      redirect '/'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'/users/new'
    end
  end
  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
