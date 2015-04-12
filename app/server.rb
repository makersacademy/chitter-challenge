require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require './lib/peep'
require './lib/user'
require_relative 'helpers/application'
require_relative 'data_mapper_setup'

enable :sessions
set :session_secret, 'super secret'
use Rack::Flash

get '/users/new' do
  @user = User.new
  erb :'users/new'
end

post '/users' do
  @user = User.create(email: params[:email],
              password: params[:password],
              password_confirmation: params[:password_confirmation])
  if @user.save
    session[:user_id] = @user.id
    redirect to('/')
  else
    flash.now[:errors] = @user.errors.full_messages
    erb :'users/new'
  end
end
