ENV['RACK_ENV'] ||= 'development'
require           'sinatra/base'
require_relative  'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  set :sessions_secret, 'super sercret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb :index
  end

  get '/user/new' do
    erb(:'user/new')
  end

  post '/' do
    name                  = params[:name]
    user_name             = params[:user_name]
    email                 = params[:email]
    password              = params[:password]
    password_confirmation = params[:password_confirmation]
    user = User.create(name: name, user_name: user_name, email: email, password: password, password_confirmation: password_confirmation)
    session[:user_id] = user.id
    redirect '/'
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
