ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  use Rack::MethodOverride
  set :session_secret, 'super secret'


  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    peep = Peep.create(peep: params[:peep], user: current_user)
    if peep.id.nil?
       flash[:errors] = peep.errors.full_messages
     redirect to "/peeps/new"
     else
       redirect to "/peeps"
     end
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
      if @user.valid?
        session[:user_id] = @user.id
        redirect to('/peeps')
      else flash.now[:errors] = @user.errors.full_messages
        erb :'users/new'
      end
  end
  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:username], params[:password])
      if user
        session[:user_id] = user.id
        redirect to('/peeps')
      elsif
        flash.now[:errors] = ['The email or password is incorrect']
        erb :'sessions/new'
      end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Goodbye!'
    redirect to '/sessions/new'
  end
  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
