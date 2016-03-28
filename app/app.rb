ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require_relative 'data_mapper_setup'


class Chitter < Sinatra::Base

  # server
  enable :sessions
  set :session_secret, 'super secret'
  use Rack::MethodOverride

  register Sinatra::Flash

  helpers do        # what does this do?
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb :index
  end

  get '/signup' do
    erb :'signup/index'
  end

  post '/account/create' do
    user = User.new(name: params[:name],
                    username: params[:username],
                    email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation])
    if user.save
      flash.next[:notice] = "Account created. Please log in."
      redirect to '/'
    else
      flash.next[:errors] = user.errors.full_messages
      redirect to '/signup'
    end
  end

  post '/sessions' do
    @user = User.authenticate(params[:username], params[:password])
    if @user
      session[:user_id] = @user.id
      redirect to '/home'
    else
      flash.next[:notice] = 'The username or password is incorrect.'
      redirect to '/'
    end
  end

  get '/home' do
    #current_user = User.get(session[:user_id])
    @peeps = Peep.all
    erb :'home/index'
  end

  post '/peep/new' do
    peep = Peep.new(message: params[:message], timestamp: Time.now.strftime('%d/%m/%Y %H:%M'))
    current_user.peeps << peep
    peep.save
    redirect to '/home'
  end

  delete '/sessions' do
    session[:user_id] = nil
    redirect '/logout'
  end

  get '/logout' do
    erb :logout
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
