ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'
require 'pry'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/signup' do
    @user = User.new
    erb :'signup'
  end

  post '/signup' do
    # We cannot directly access the password attribute, so we use bcrypt
    # and instead deal with the password_digest:
    @user = User.create(username: params[:username],
                      email: params[:email],
                      password: params[:password],
                      password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'signup'
    end
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
