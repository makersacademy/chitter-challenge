ENV['ENV_RACK'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base

  # server
  enable :sessions
  set :session_secret, 'super secret'

  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/signup' do
    erb :'signup/index'
  end

  post '/account/create' do
    user = User.new(name: params[:name],
                    username: params[:username],
                    email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation])
    if user.save
      flash.next[:notice] = "Account created. Please log in."
      redirect to '/'
    else
      flash.next[:errors] = user.errors.full_messages
      redirect to '/signup'
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
