ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'

  post '/users' do
    @user = User.new(email: params[:email],
      password: params[:password],
      name: params[:name],
      username: params[:username],
      password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/peeps')
    else
      flash.now[:notice] = 'Password and confirmation password do not match'
      erb :'users/new'
    end
  end

  get '/users/new' do
    session[:user_id] = nil
    @user = User.new
    erb :'users/new'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end


  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(message: params[:message])
    redirect '/peeps'
  end




  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0

end
