ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative '../data_mapper_setup.rb'

require_relative '../app/server.rb'
require_relative '../app/controllers/peeps.rb'

require_relative '../app/controllers/sessions.rb'
require_relative '../app/controllers/users.rb'

# require 'sinatra/base'
# require 'sinatra/flash'
# require_relative 'models/peep.rb'
# require_relative 'models/user.rb'
# require_relative '../data_mapper_setup.rb'
#
# class Chitter < Sinatra::Base
#   use Rack::MethodOverride
#   register Sinatra::Flash
#   enable :sessions
#   set :session_secret, 'super secret'
#
#   get '/' do
#      redirect to('/peeps')
#   end
#
#   # get '/peeps' do
#   #   @peeps = Peep.all
#   #   erb :'peeps/index'
#   # end
#   #
#   # get '/peeps/new' do
#   #   erb :'peeps/new'
#   # end
#   #
#   # post '/peeps' do
#   #   peep = Peep.create(user: params[:user], message: params[:message])
#   #   peep.save
#   #   redirect to('/peeps')
#   # end
#
#   # get '/users/new' do
#   #   @user = User.new
#   #   erb :'users/new'
#   # end
#   #
#   # post '/users' do
#   #   @user = User.new(email: params[:email],
#   #     password: params[:password],
#   #     password_confirmation: params[:password_confirmation])
#   #   if @user.save
#   #     session[:user_id] = @user.id
#   #     redirect to('/')
#   #   else
#   #     flash.now[:errors] = @user.errors.full_messages
#   #     erb :'users/new'
#   #   end
#   # end
#
#   # get '/sessions/new' do
#   #   erb :'sessions/new'
#   # end
#   #
#   # post '/sessions' do
#   #   user = User.authenticate(params[:email], params[:password])
#   #     if user
#   #       session[:user_id] = user.id
#   #       redirect to('/peeps')
#   #     else
#   #       flash.now[:errors] = ['The email or password is incorrect']
#   #       erb :'sessions/new'
#   #     end
#   # end
#
#   helpers do
#     def current_user
#       @current_user ||= User.get(session[:user_id])
#     end
#   end
#
#   # delete '/sessions' do
#   #   session[:user_id] = nil
#   #   flash.keep[:notice] = 'goodbye!'
#   #   redirect to '/peeps'
#   # end
#
  # run! if app_file == $PROGRAM_NAME
# end
