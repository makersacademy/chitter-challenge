ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/user.rb'
require_relative 'models/peep.rb'
require_relative 'data_mapper_setup'
require './helpers.rb'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  helpers Helpers

  get '/users/sign-up' do
    @user = User.new
    erb :sign_up
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/chitter')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  post '/users' do
    @user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/chitter')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :sign_up
    end
  end

  get '/chitter' do
    @peeps = Peep.all
    erb :chitter
  end

  post '/create-peep' do
    Peep.create(message: params[:message])
    redirect to '/chitter'
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'goodbye :)'
    redirect to '/sessions/new'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
