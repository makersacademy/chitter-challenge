ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'

require './app/models/peeps'
require './app/models/user'
require './app/data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  get '/' do
    redirect '/peeps'
  end

  post '/peeps' do
    Peep.create(message: params[:message],
                time: "#{(Time.now + 1 * 60 * 60).hour}:#{Time.now.min}")
    redirect '/peeps'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/timeline'
  end

  get '/users/new' do
    @user = User.new # makes available for new.erb if wrong password
    erb :'user/new'
  end

  post '/users/new' do
    @user = User.create(username: params[:username],
                        email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
    if @user.save # checks if record saved to db (if passwords match)
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'user/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Goodbye!'
    redirect to '/peeps'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $PROGRAM_NAME
end
