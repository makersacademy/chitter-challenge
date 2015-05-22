require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'
require_relative 'models/user'
require_relative 'data_mapper_setup'


class ChitterChatter < Sinatra::Base

  enable :sessions
  set :session_secret, "verysecret"
  set :views, Proc.new {File.join(root, "views")}

  use Rack::Flash

   helpers do
      def current_user
        @current_user ||= User.get(session[:user_id]) if session[:user_id]
      end
    end

  get '/' do
    erb :index
  end

  get '/users/new' do
    @user = User.new
    erb :newuser
  end

  post '/users' do
    @user = User.create(email: params[:email],
                      name: params[:name],
                      username: params[:username],
                      password: params[:password],
                      password_confirmation: params[:password_confirmation] )
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash[:errors] = @user.errors.full_messages
      redirect to('users/new')
    end
  end

  post '/sessions' do
    email, password = params[:email], params[:password]
    user = User.authenticate(email, password)
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash[:errors] = ['The email or password is incorrect']
      erb :signin
    end
  end

  delete '/sessions' do
    session[:name] = nil
    flash[:notice] = "Goodbye!"
    redirect to('/')
  end


  get '/sessions/new' do
    erb :signin
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
