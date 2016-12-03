ENV['RACK_ENV']||='development'
require 'sinatra/base'
require 'pry'
require_relative  './models/user.rb'
require_relative './models/database_setting.rb'
require 'dm-core'
require 'sinatra'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  set :sessions_secret, 'super secret'
  register Sinatra::Flash

  helpers do
    def current_user
      User.first(id: session[:id])
    end
  end

  before do
    @user = current_user
  end


  get '/' do
    erb :index
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/new_user' do
    user = User.create(name: params[:name], user_name: params[:user_name],
                        email: params[:email], password: params[:password])
    if user.save
      session[:id] = user.id
      redirect '/'
    else
      flash.now[:notice] = "Email is already taken"
      erb :sign_up
    end
  end

  get '/sign_up' do

  end

  get '/chitter' do

  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
