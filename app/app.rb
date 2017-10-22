ENV['RACK_ENV'] ||= 'development'
require 'sinatra'
require 'sinatra/flash'
require 'sinatra/base'
require 'bcrypt'
require './app/data_mapper_setup'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  enable :sessions

  get '/' do
    erb :index
  end

  get '/infrastructure' do
    'infrastructure working'
  end

  get '/peeps/new' do
    erb :'peeps/new_peep'
  end

  post '/feed' do
    Peep.create(contents: params[:peep], time: Time.now)
    redirect '/feed'
  end

  get '/feed' do
    @peeps = Peep.all.reverse
    erb :feed
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new_user'
  end

  post '/users' do
    @user = User.create(email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/users/confirmation'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new_user'
    end
  end

  get '/users/confirmation' do
    erb :'users/confirmation'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end

  end
end
