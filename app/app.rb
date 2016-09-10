ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(email: params[:email],
    password: params[:password],
    password_confirmation: params[:password_confirmation])
      if @user.save
        session[:user_id] = @user.id
        redirect to('/peeps')
      else
        flash.now[:errors] = @user.errors.full_messages
        erb :'users/new'
      end
    end

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end

  end
  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(msg: params[:msg])
    redirect '/peeps'
  end

end
