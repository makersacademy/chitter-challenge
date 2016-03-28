ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'pry'
require 'sinatra/flash'
require_relative 'data_mapper_setup'


class Chitter < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  get '/users/new' do
     @user = User.new
     erb :'/users/new'
  end


  post '/signup' do
    @user = User.new(name: params[:name], email: params[:email],
                    username: params[:username], password: params[:password],
                    password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      flash.now[:notice] = "Password and confirmation password do not match"
      erb :'/users/new'
    end
  end

  get '/peeps' do
    erb :'peeps/index'
  end

  post '/peeps/new' do
   peep = Peep.new(message: params[:message])
    current_user.peeps << peep
    peep.save
    current_user.save
   redirect '/peeps'
 end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

   helpers do
   def current_user
      @current_user ||= User.get(session[:user_id])
    end
   end

    run! if app_file == $0

end
