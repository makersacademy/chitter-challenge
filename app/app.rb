ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/user'
require_relative 'models/post'
require_relative 'data_mapper_setup'


class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  use Rack::MethodOverride

  get '/' do
    redirect '/home'
  end

  get '/home' do
    @current_user = session[:name]
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
      session[:name] = @user.name
      session[:user_session] = @user
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
    cheet = Post.create(title: params[:title], body: params[:body])
    @user = session[:user_session]
    @user.posts << cheet
    redirect '/home'
  end

   delete '/log_out' do
      session[:user_id] = nil
      session[:name] = nil
      redirect to('/home')
    end




  # start the server if ruby file executed directly
  run! if app_file == $0
end
