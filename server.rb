require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require './lib/chit'
require './lib/user'
require './helpers/application'
require_relative 'data_mapper_setup'

require_relative 'controllers/chits_controller'
require_relative 'controllers/users_controller'
require_relative 'controllers/sessions_controller'

enable :sessions
set :session_secret, 'super secret'
use Rack::Flash
use Rack::MethodOverride

get '/' do
  @chit = Chit.all
  erb :index
end

# post '/chits' do
#   username = params["username"]
#   text = params["text"]
#   Chit.create(:username => username, :text => text)
#   redirect to('/')
# end

# get '/users/new' do
#   @user = User.new
#   erb :"users/new"
# end

# post '/users' do
#   @user = User.new(:email => params[:email], 
#               :password => params[:password],
#               :password_confirmation => params[:password_confirmation])  
#     if @user.save
#       session[:user_id] = @user.id
#       redirect to('/')
#     else
#       flash.now[:errors] = @user.errors.full_messages
#       erb :"users/new"
#     end
#   end

  # get '/sessions/new' do
  #   erb :"sessions/new"
  # end

  # post '/sessions' do
  #   email, password = params[:email], params[:password] 
  #   user = User.authenticate(email, password)
  #   if user
  #     session[:user_id] = user.id
  #     redirect to('/')
  #   else
  #     flash[:errors] = ["The email or password is incorrect"]
  #     erb :"sessions/new"
  #   end
  # end

  # delete '/sessions' do
  #   flash[:notice] = "Good bye!"
  #   session[:user_id] = nil
  #   redirect to('/')
  # end


