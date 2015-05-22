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
    @current_user ||= User.get(session[:id]) if session[:id]
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
    redirect '/'
  else
    flash.now[:notice] = @user.errors.full_messages
    erb :signup
  end
end