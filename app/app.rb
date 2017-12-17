ENV["RACK_ENV"] ||= "development"
require 'date'
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  use Rack::MethodOverride
  register Sinatra::Flash
  enable :sessions
  set :session_secret, "super secret"

  helpers do
    def current_user
      @current_user ||= User.get(session[:id])
    end
  end

  get '/' do
    @peeps = Peep.all
    erb(:index)
  end

  get '/user/new' do
    @user = User.new
    erb(:signup)
  end

  post '/user' do
    @user = User.create(email: params[:email],
                       name: params[:name],
                       username: params[:username],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
    if @user.save
      session[:id] = @user.id
      redirect '/'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb(:signup)
    end
  end

  get '/sessions/new' do
    erb(:signin)
  end

  post '/session' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:id] = user.id
      redirect to '/'
    else
      flash.now[:errors] = ["Your email or password is incorrect"]
      erb(:signin)
    end
  end

  delete '/sessions' do
    session[:id] = nil
    flash.keep[:notice] = "Goodbye"
    redirect to '/'
  end

  get '/peep/new' do
    erb(:new_peep)
  end

  post '/peeps' do
    Peep.create(message: params[:message], user: current_user, time: Time.new)
    redirect '/'
  end

  run! if app_file == $0

end
