require 'sinatra'
require 'data_mapper'
require 'rack-flash'

require_relative 'data_mapper_setup'

require './app/models/user'

enable :sessions
set :session_secret, 'super secret'
use Rack::Flash

helpers do

  def current_user
    @current_user ||= User.get(session[:user_id]) if session[:user_id]
  end

end

get '/' do
  erb :index
end

get '/signup' do
  @user = User.new
  erb :signup
end

post '/signup' do
  @user = User.create(email: params[:email],
              password: params[:password],
              password_confirmation: params[:password_confirmation],
              name: params[:name],
              username: params[:username])
  if @user.save
    session[:id] = @user.id
    "Welcome #{@user.email}!"
  else
    flash.now[:notice] = 'This email is already taken'
    erb :signup
  end
end