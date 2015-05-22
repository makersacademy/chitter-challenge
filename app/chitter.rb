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

  get '/' do
    @name = session[:name]
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
                      password: params[:password] )
    if @user.save
      session[:name] = @user.username
      redirect to('/')
    else
      flash[:errors] = "Email already signed up"
      redirect to('users/new')
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
