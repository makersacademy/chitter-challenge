ENV["RACK_ENV"] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup.rb'
require_relative 'models/beep'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/beeps' do
    if Beep.count > 0
      @beeps = Beep.all
      @beeps.sort_by { |beep| beep.created_at }
      @beeps.reverse!
    end
    erb :beeps
  end

  post '/beeps' do
    Beep.create(body: params[:body], created_at: Time.now.to_i)
    redirect '/beeps'
  end

  get '/beeps/new' do
    erb :beeps_new
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.new(user_name: params[:user_name], full_name: params[:full_name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect to('/beeps')
    else
      flash.now[:notice] = "Password and confirmation do not match"
      erb :'users/new'
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end
