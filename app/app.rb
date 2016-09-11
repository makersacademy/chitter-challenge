ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'datamapper_setup'


class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all.reverse
    erb :'peeps/index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users/new' do
    @user = User.create(name: params[:name], email: params[:email],
                    username: params[:username],
                    password: params[:password],
                    password_confirmation: params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash.now[:errors] = ['Invalid email or password']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = "Thank you and see you soon!"
    redirect '/peeps'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    user = User.get(session[:user_id])
    peep = Peep.create(peep: params[:peep], author: user.username,
                       time: Time.now.strftime("%H:%M"))
    peep.save
    redirect '/peeps'
  end

helpers do
 def current_user
   @current_user ||= User.get(session[:user_id])
 end
end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
