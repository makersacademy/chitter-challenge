ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require_relative 'models/user'
require_relative 'models/peep'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  # use Rack:MethodOverride
  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb :index
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    user = User.create(name: params[:name],
    username: params[:username],
    email: params[:email],
    password: params[:password],
    password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect '/'
  end

  get '/log_in' do
    erb :log_in
  end

  post '/log_in' do
    user = User.authenticate(params[:username],params[:password])
    if user
      session[:user_id] = user.id
      redirect '/logged_in'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :log_in
    end
  end

  get '/logged_in' do
    @user = User.get(session[:user_id])
    erb :logged_in
  end

  post '/add_peep' do
    user = User.get(session[:user_id])
    peep = Peep.create(title: params[:title], content: params[:content])
    user.peeps << peep
    user.save
    p peep.user.username
    redirect '/logged_in'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
