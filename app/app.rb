ENV["RACK_ENV"]||="development"
require 'sinatra/base'
require 'sinatra/flash'
require './app/models/user.rb'

class Chitter < Sinatra::Base

  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'chitter secret'

  helpers do
    attr_writer :current_user
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb :index
  end

  get '/sign-up' do
    erb :sign_up
  end

  post '/user-info' do
    user = User.create(name:  params[:name],  username: params[:username],
                       email: params[:email], password: params[:password],
                       password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect '/'
    else
      flash[:errors] = user.errors.full_messages
      redirect '/sign-up'
    end
  end

  get '/log-in' do
    erb :log_in
  end

  post '/log-in-info' do
    log_in_user = User.authenticate(params[:email], params[:password])
    if !log_in_user
      flash[:notice] = "The email or password is incorrect"
      redirect '/log-in'
    end
    session[:user_id] = log_in_user.id
    redirect('/')
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
