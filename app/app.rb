ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'
require './app/models/peep'
require './app/models/user'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'session'
  register Sinatra::Flash

  helpers do
     def current_user
       @current_user ||= User.get(session[:user_id])
     end
  end

  get '/users/new' do
    @user = User.new
    erb :sign_up
  end

  post '/users' do
    @user = User.new(name: params[:name], username: params[:username],
    email: params[:email], password: params[:password],
    password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :sign_up
    end
  end

  get '/peeps' do
    current_user
    @peeps = Peep.all
    erb :peeps
  end

  get '/peeps/new' do
    erb :new_peep
  end

  post '/peeps' do
    peep = Peep.first_or_create(user_id: current_user.id,
      message: params[:message])
    peep.save
    redirect to('/peeps')
  end


run! if app_file == $0
end
