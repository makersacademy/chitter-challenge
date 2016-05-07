ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    redirect :'users/sign_up'
  end

  get '/users/sign_up' do
    @user = User.new
    erb :'users/sign_up'
  end

  post '/users' do
    @user = User.create(name: params[:name],
                username: params[:username],
                email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
  if @user.save 
    session[:user_id] = @user.id
    redirect to('/peeps')
  else
    flash.now[:notice] = "Passwords do not match"
    erb :'users/sign_up'
  end
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/post' do
    erb :'peeps/post'
  end

  post '/peeps' do
    time = Time.now
    Peep.create(body: params[:body], time_posted: time)
    redirect to :'/peeps'
  end

  run! if app_file == $0
end
