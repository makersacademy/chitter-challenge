ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/chit'
require_relative 'models/user'
require_relative 'data_mapper_setup'


class ChitterChallenge < Sinatra::Base

  use Rack::MethodOverride
  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    # if current_user
    #   redirect '/chits'
    # end
    @user = User.new
    erb :'index'
  end

  get '/chits' do
    @chits = Chit.all
    erb :'chits/index'
  end

  post '/chits' do
    chit = Chit.new(text: params[:text])
    current_user.chits << chit
    current_user.save
    redirect '/chits'
  end


  post '/sign_up' do
    @user = User.create(username: params[:username],
                email: params[:email],
                name: params[:name],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/chits')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'index'
    end
  end


  post '/sign_in' do
  user = User.authenticate(params[:username], params[:password])
  if user
    session[:user_id] = user.id
    redirect to('/chits')
  else
    flash.now[:errors] = ['The email or password is incorrect']
    erb :'index'
  end
end

delete '/sessions' do
  session[:user_id] = nil
  flash.keep[:notice] = 'goodbye!'
  redirect to '/'
end

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
end


  run! if app_file == $0

end
