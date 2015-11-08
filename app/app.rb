require 'sinatra/base'
require 'sinatra/flash'
require_relative 'datamapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end

  get '/' do
    erb :index
  end

  get '/user/sign_up' do
    @user = User.new
    erb :'user/sign_up'
  end

  post '/user/sign_up' do
    @user = User.new(user_name: params[:user_name],
                email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/home'
    else
      flash.now[:errors]= @user.errors.full_messages
      erb :'user/sign_up'
    end
  end

  get '/home' do
    @peeps = Peep.all
    erb :home
  end

  post '/home/new_post' do
    peep = Peep.new(text: params[:peep_box])
    peep.user = current_user
    peep.save
    redirect '/home'
  end

  get '/sessions' do
    erb :'/sessions/new'
  end

  post '/sessions/new' do
    user = User.authenticate(params[:user_name], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/home'
    else
      flash.now[:errors] = ['The username or password is incorrect']
      erb :'sessions/new'
    end
  end

  post '/user/sign_out' do
    session[:user_id] = nil
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
