ENV["RACK_ENV"] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'
require 'sinatra'

class Chitter < Sinatra::Base
  use Rack::MethodOverride
  enable :sessions
  set :session_secret, 'super secret'

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post "/peeps" do
    user = User.get(session[:user_id])
      peep = Peep.create(content: "#{params[:content]}")
      peep.users << user
      peep.save
      redirect "/peeps"
  end

  post '/peeps/new' do
    if session[:user_id] != nil
      redirect '/peeps/new'
    else
      @peeps = Peep.all
      flash.now[:errors] = ['Please login to post a new peep']
      erb :'peeps/index'
    end
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(email: params[:email],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation],
                     username: params[:username],
                     name: params[:name])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/peeps')
    else
       flash.now[:errors] = @user.errors.full_messages
       erb :'users/new'
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
    flash.keep[:notice] = 'You have signed out!'
    redirect to '/peeps'
  end

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end

  register Sinatra::Flash
  # start the server if ruby file executed directly
  run! if app_file == $0
end
