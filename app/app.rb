ENV['RACK_ENV'] ||= 'development'

require 'data_mapper'
require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'models/user'
require_relative 'server'
require_relative 'controllers/peeps'
require_relative 'controllers/users'
require_relative 'controllers/sessions'
require_relative 'data_mapper_setup'


# class Chitter < Sinatra::Base

  # use Rack::MethodOverride
  #
  # enable :sessions
  # register Sinatra::Flash
  # set :session_secret, 'super_secret'

  # get '/' do
  #   redirect to ('/peeps/index')
  # end
  #
  # get '/peeps/index' do
  #   @peeps = Peep.all
  #   @username = current_user.username if current_user
  #   erb :'peeps/index'
  # end
  #
  # post '/peeps' do
  #   peep = Peep.new(user: current_user.username,
  #                   peep: params[:peep])
  #   peep.save
  #   redirect to ('/peeps/index')
  #   erb :'peeps/index'
  # end

  # get '/user/new' do
  #   @user = User.new
  #   erb :'/user/new'
  # end
  #
  # post '/user' do
  #   @user = User.new(username: params[:username],
  #                    email: params[:email],
  #                    password: params[:password],
  #                    password_confirmation: params[:password_confirmation])
  #   if @user.save
  #     session[:user_id] = @user.id
  #     redirect to('/peeps/index')
  #   else
  #     flash.now[:errors] = @user.errors.full_messages
  #     erb :'/user/new'
  #   end
  # end

  # get '/sessions/new' do
  #   erb :'sessions/new'
  # end
  #
  # post '/sessions' do
  #   user = User.authenticate(params[:username],
  #                             params[:password])
  #   if user
  #     session[:user_id] = user.id
  #     redirect to '/peeps/index'
  #   else
  #     flash.now[:errors] = [ "Username or password is incorrect" ]
  #     erb :'sessions/new'
  #   end
  # end
  #
  # delete '/sessions' do
  #   session[:user_id] = nil
  #   flash.keep[:notice] = 'Bye!'
  #   redirect to '/peeps/index'
  # end


  # helpers do
  #   def current_user
  #     @current_user ||= User.get(session[:user_id])
  #   end
  # end


# end
