ENV["RACK_ENV"] ||= 'development'

require 'data_mapper'
require 'pry'
require 'sinatra/base'
require 'sinatra/flash'

require_relative'./lib/user'
load './config/datamapper_setup.rb'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  set :method_override, true

  get '/' do
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    user = User.create(email: params[:email],
                       password: params[:password],
                       username: params[:username])
    session[:user_id] = user.id
    flash[:signup_success] = 'You signed up successfully!'
    redirect '/profile'
  end

  get '/profile' do
    erb :profile
  end

  run! if app_file == $0

  private

  def signed_in?
    !current_user.nil?
  end

  def current_user
    @current_user ||= User.get(session[:user_id])
  end

end
