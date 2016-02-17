ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/peep'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps' do
    Peep.create(name: params[:name], username: params[:username], text: params[:text], time: params[:time])
    redirect to('/peeps')
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps/new' do
    redirect to('/peeps/new')
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
  @user = User.new(email: params[:email],
                  password: params[:password],
                  password_confirmation: params[:password_confirmation])
  if @user.save
    session[:user_id] = @user.id
    redirect to('/peeps')
  else
    flash.now[:notice] = "Password and confirmation password do not match"
    erb :'users/new'
  end
end

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
