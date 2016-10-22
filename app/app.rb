ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'models/data_mapper_setup'
require_relative 'models/peep'
require_relative 'models/user'
require 'sinatra/flash'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  attr_reader :logged_in

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  post '/signup/new' do
    @user = User.create(name: params[:name],
    email: params[:email],
    username: params[:username],
    password: params[:password])
    redirect '/'
  end

  run! if app_file == $0
end
