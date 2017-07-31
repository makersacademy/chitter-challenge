ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  use Rack::MethodOverride
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:current_user_id])
    end
  end

  get '/' do
    @peeps = Peep.all(:order => [:created_at.desc])
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all(:order => [:created_at.desc])
    erb :peeps
  end

  post '/peep' do
    Peep.create(message: params[:peep], user_id: current_user.id)
    redirect to '/peeps'
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    @user = User.new(name: params[:name],
                      username: params[:username],
                      email: params[:email],
                      password: params[:password],
                      password_confirmation: params[:password_confirmation])
    if @user.save
      session[:current_user_id] = @user.id
      redirect to '/peeps'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :sign_up
    end
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:current_user_id] = user.id
      redirect to '/peeps'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :login
    end
  end

  delete '/sessions' do
    session[:current_user_id] = nil
    flash.keep[:notice] = 'goodbye!'
    redirect to '/'
  end

  run! if app_file == $0
end
