ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
# require_relative 'controllers/peeps'
require 'pry'

class Chitter < Sinatra::Base

  use Rack::MethodOverride

  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    'Hello Chitter!'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(name: params[:name], email: params[:email],
                      username: params[:username], password: params[:password],
                      password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/session/new' do
    erb :'session/new'
  end

  post '/session' do
    user = User.authenticate(params[:username],
                             params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash.now[:errors] = ['Email or password incorrect']
      erb :'session/new'
    end
  end

  delete '/session' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Goodbye'
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all(:order => [ :time.desc ])
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(time: Time.now, content: params[:content], :user => current_user)
    redirect '/peeps'
  end



  run! if app_file == $0
end
