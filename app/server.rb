require 'sinatra'
require 'data_mapper'
require 'rack-flash'

require_relative 'data_mapper_setup'

require './app/models/user'

enable :sessions
set :session_secret, 'super secret'
use Rack::Flash

get '/' do
  erb :index
end

get '/signup' do
  erb :signup
end

post '/newuser' do
  user = User.create(email: params[:email],
              password: params[:password],
              password_confirmation: params[:password_confirmation],
              name: params[:name],
              username: params[:username])
  if user.save
    session[:id] = user.id
    "Welcome #{user.email}!"
  else
    redirect '/signup'
    flash.now[:error] = user.errors.full_messages
  end
end