ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'dm-validations'
require 'sinatra/flash'
require_relative '../data_mapper_setup'
require_relative 'models/user'
require_relative 'models/peeps'

class ChitterChallenge < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    redirect('users/new')
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  helpers do
      def current_user
        @current_user ||= User.get(session[:user_id])
      end
    end

  post '/users' do
    @user = User.new(email: params[:email],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation])
    if @user.save
     session[:user_id] = @user.id
      redirect to('/peeps/new')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/peeps' do
   Peep.create(name: params[:name], username: params[:username],
                   content: params[:content])
   redirect to '/peeps/peeplist'
  end

  get '/peeps/peeplist' do
      @peeps = Peep.all
      erb :'peeps/peeplist'
    end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      session[:user] = params[:email]
      redirect to('/peeps/new')
    else
      flash.now[:errors] = ['The username or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    session[:user] = nil
    flash.next[:notice] = 'goodbye!'
    redirect to('/sessions/new')
  end
    run! if app_file == $0
end
