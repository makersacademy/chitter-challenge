ENV['RACK_ENV'] ||= 'development'

require 'bcrypt'
require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'
require 'dm-validations'
require 'sinatra'
require 'sinatra/flash'
require './models/peep'
require './models/user'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  register Sinatra::Flash
  enable :sessions
  TIME_STAMP_FORMAT = "%d/%m/%Y at %l:%M%P"

  helpers do
    def current_user
      @current_user ||= User.get(session[:current_user_id])
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:current_user_id] = user.id
      redirect '/peeps'
    else
      flash.now[:errors] = ['Incorrect email or password!']
      erb :'sessions/new'
    end
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users/new' do
    @user = User.new(username:              params[:username],
                     email:                 params[:email],
                     password:              params[:password],
                     password_confirmation: params[:password_confirm])
    if @user.save
      session[:current_user_id] = @user.id
      redirect '/peeps'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps/new' do
    Peep.create(message: params[:message], user: current_user)
    redirect '/peeps'
  end

  get '/peeps' do
    @user = current_user
    @peeps = Peep.all
    erb :'peeps/index'
  end

end
