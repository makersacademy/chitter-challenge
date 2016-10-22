ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/data_mapper_setup'

class Chitter < Sinatra::Base
  #use Rack::MethodOverride
  register Sinatra::Flash
  enable :sessions
  #set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb :home
  end

  get '/register' do
    @user = User.new
    erb :'register/index'
  end

  post '/register' do
    @user = User.new(email: params[:email],
    password: params[:password],
    password_confirmation: params[:password_confirmation])
      if @user.save
        session[:user_id] = @user.id
        redirect '/peeps'
      else
        flash.now[:errors] = @user.errors.full_messages
        erb :'register/index'
      end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
      if user
        session[:user_id] = user.id
        redirect to ('/peeps')
      else
        flash.now[:errors] = ['The email or password is incorrect']
        erb :'sessions/new'
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
    peep = Peep.new(title: params[:title])
    peep.save
    redirect '/peeps'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
