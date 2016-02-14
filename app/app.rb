ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/user'
require_relative 'models/post'
require_relative 'data_mapper_setup'


class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  get '/' do
    redirect '/home'
  end

  get '/home' do
    current_user
    @posts = Post.all
    erb :home_page

  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    @user = User.new(name: params[:name], username: params[:username], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
        session[:name] = @user.name
        session[:user_id] = @user.id
        puts "sign up #{@user.name}"
        redirect '/home'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :sign_up
    end
  end

  get '/log_in' do
    erb :log_in
  end

  post '/log_in' do
    @user = User.authenticate(params[:username], params[:password])
    if @user
      session[:user_id] = @user.id
      puts "log in #{@user.name}"
      redirect to('/home')
    else
      flash.now[:errors] = ["The username and password do not match"]
      erb :log_in
    end
  end

  get '/make_cheet' do
    erb :make_cheet
  end

  post '/make_cheet' do
    Post.create(title: params[:title], body: params[:body])
    redirect '/home'
  end

   delete '/log_out' do
      session[:user_id] = nil
      flash.keep[:notice] = 'Goodbye!'
      redirect to('/home')
    end

helpers do
 def current_user
   @current_user ||= User.get(session[:user_id])
 end
end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
