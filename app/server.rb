require 'data_mapper'
require 'rack-flash'
require 'sinatra/base'
require 'sinatra/partial'
require 'tilt/erb'

require_relative 'helpers/application'

require_relative 'models/peep'
require_relative 'models/user'

env = ENV['RACK_ENV'] || 'development'
DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
DataMapper.finalize
DataMapper.auto_upgrade!

class Chitter < Sinatra::Base

  configure do
    register Sinatra::Partial
    set :partial_template_engine, :erb
  end

  enable :sessions
  set :session_secret, 'super secret'
  set :partial_template_engine, :erb
  use Rack::Flash
  use Rack::MethodOverride

  # get '/' do
  #   @peeps = Peep.all
  #   erb :index
  # end

  # post '/peeps' do
  #   message = params['message']
  #   Peep.create message: message
  #   redirect to '/'
  # end

  # get '/users/new' do
  #   @user = User.new
  #   erb :'users/new'
  # end
  #
  # post '/users' do
  #   @user = User.new email: params[:email],
  #                    password: params[:password],
  #                    password_confirmation: params[:password_confirmation],
  #                    user_name: params[:user_name],
  #                    user_handle: params[:user_handle]
  #   if @user.save
  #     session[:user_id] = @user.id
  #     redirect to('/')
  #   else
  #     flash.now[:errors] = @user.errors.full_messages
  #     erb :'users/new'
  #   end
  # end

  # get '/sessions/new' do
  #   erb :'sessions/new'
  # end
  #
  # post '/sessions' do
  #   email, password = params[:email], params[:password]
  #   user = User.authenticate(email, password)
  #   if user
  #     session[:user_id] = user.id
  #     redirect to('/')
  #   else
  #     flash[:errors] = ['The email or password is incorrect']
  #     erb :'sessions/new'
  #   end
  # end
  #
  # delete '/sessions' do
  #   session[:user_id] = nil
  #   erb :'sessions/goodbye'
  # end

  run! if app_file == $PROGRAM_NAME

end

require_relative 'controllers/application'
require_relative 'controllers/peeps'
require_relative 'controllers/sessions'
require_relative 'controllers/users'
