ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'sinatra/flash'
require_relative './data_mapper_setup'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  use Rack::MethodOverride
  enable :sessions
  set :encrypted_sessions, 'valid'

  get '/' do
    redirect('/home')
  end

  post '/signup' do
    @user = User.create(name: params[:name], username: params[:username],
                       email: params[:email], password: params[:password],
                       password_confirmation: params[:confirm_password])
    if @user.save
      session[:user_id] = @user.id
      redirect '/home'
    else
      flash.now[:signup_errors] = @user.errors.full_messages
      erb(:signup)
    end
  end

  get '/signup' do
    @user = User.new
    erb(:signup)
  end

  get '/login' do
    erb(:login)
  end

  post '/login' do
    @user = User.authenticate(params[:email], params[:password])
    if @user
      session[:user_id] = @user.id
      redirect '/home'
    else
      flash.now[:login_error] = 'Invalid login details'
      erb(:login)
    end
  end

  get '/home' do
    current_user
    @peeps = Peep.all
    flash.now[:notice] = "Welcome to Chitter, #{@user.name}" if @user
    erb(:index)
  end

  post '/peep' do
    current_user
    time = Time.now.to_s[0, 16]
    peep = Peep.create(body: params[:peep], timestamp: time)
    @user.peeps << peep
    @user.save
    redirect '/home'
  end

  delete '/logout' do
    session[:user_id] = nil
    flash.keep[:notice] = 'You logged out!'
    redirect '/home'
  end

  helpers do
    def current_user
      @user ||= User.get(session[:user_id])
    end
  end
end
