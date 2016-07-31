ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/user'
require_relative 'models/data_mapper_setup'

class Chitter < Sinatra::Base
  use Rack::MethodOverride
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
  erb :home
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(name: params[:name],
                        username: params[:username],
                        email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    else
      flash.now[:bad] = "Your passwords don\'t match"
      erb :'users/new'
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
#
#   get '/sessions/new' do
#   erb :'sessions/new'
# end
#
# post '/sessions' do
#   @user = User.authenticate(params[:email], params[:password])
#   if @user
#     session[:user_id] = @user.id
#     redirect '/'
#   else
#     flash.now[:errors] = ['The email or password is incorrect']
#     erb :'sessions/new'
#   end
# end
#
#   delete '/sessions' do
#    session[:user_id] = nil
#    flash.keep[:notice] = "Bye!"
#    redirect '/'
#  end

  run! if app_file == $0
end
