require 'data_mapper'
require 'sinatra/base'
require 'sinatra/flash'
require_relative './models/peep.rb'
require_relative './models/user.rb'
require 'sinatra/twitter-bootstrap'
ENV['RACK_ENV'] ||= 'development'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  register Sinatra::Twitter::Bootstrap::Assets
  set :session_secret, 'super secret'
  use Rack::MethodOverride

  get '/' do
    redirect to('/users/new')
  end

  get '/peeps' do
    @peeps = Peep.all
    erb(:index)
  end

  get '/peeps/new' do
    erb(:new)
  end

  get '/users/new' do
    @user = User.new
    erb(:'users/new')
  end

  get '/sessions/new' do
    erb(:'sessions/new')
  end

  post '/users' do
    @user = User.create(email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb(:'users/new')
    end
  end

  post '/peeps' do
    peep = Peep.new(title: params[:title], text: params[:text])
    peep.save
    redirect to('/peeps')
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb(:'sessions/new')
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'goodbye!'
    redirect to('/peeps')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $PROGRAM_NAME
end
