ENV["RACK_ENV"] ||= 'development'
require 'sinatra/base'
require 'sinatra/flash'
require_relative '../lib/datamapper_setup'
class Chitter < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'


  get '/' do
    'Hello chitter!'
  end

  get '/user/sign_up' do
    erb(:sign_up)
  end

  post '/user/sign_up' do
    @user = User.new(email: params[:email], name: params[:name], username: params[:username])
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]

    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      flash[:errors] = @user.errors.full_messages
      redirect '/user/sign_up'
    end
  end

  get '/peeps' do
    erb(:peeps)
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
