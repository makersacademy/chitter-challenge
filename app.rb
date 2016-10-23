ENV['RACK_ENV'] = 'development'
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require "dm-validations"
require_relative './models/user'
require_relative './models/peep'

class Chitter < Sinatra::Base
  use Rack::MethodOverride
  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'


  helpers do
     def current_user
       @current_user ||= User.first(session[:user_id])
     end
  end

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/user' do
      user = User.authenticate(params[:username], params[:password])
      if user
      session[:user_id] = user.id
      @welcome = "Welcome #{user.name}!"
      @peeps = Peep.all
      erb :peeps
      else
      flash.now[:notice] = "Username or password not valid, try again"
      erb :index
      end
  end

  post '/new_user' do
    user = User.create(username: params[:new_username], email: params[:new_email], name: params[:new_name], password: params[:new_password])
    user.save
    if user.save
      session[:user_id] = user.id
      @welcome = "Welcome #{user.name}!"
      @peeps = Peep.all
      erb :peeps
    else
      flash.now[:notice] = "All fields need to be filled in"
      erb :index
    end
  end

  post '/new_peep' do
    # session[:user_id] = user.id
    @peeps = Peep.all
    peep = Peep.create(text: params[:new_peep], created_at: Time.new)
    peep.save!
    erb :peeps
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'goodbye!'
    redirect to '/'
  end



  # start the server if ruby file executed directly
  run! if app_file == $0
end
