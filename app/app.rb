ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  set :session_secret, 'super secret'


  get '/' do
    erb "Hello Chitter"
  end

  get '/users/new' do
    erb(:'users/new')
  end

  post '/users' do
    @user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      #redirect to('/peeps')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb(:'/users/new')
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
