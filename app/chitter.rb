ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require './data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    'welcome'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users/new' do
    @user = User.new(name: params[:name], username: params[:username], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      redirect '/'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
