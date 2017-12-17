ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/home' do
    @user_name = session[:user_name]
    @peeps = Peep.all
    erb :home
  end

  get '/peep/new' do
    erb :'peep/new'
  end

  post '/peep/new' do
    peep = Peep.create(message: params[:peep], datetime: "#{Time.new.strftime("%A, %d %b %Y %l:%M %p")}")
    peep.save
    redirect '/home'
  end

  get '/users/new' do
    @user = User.new
    erb(:'users/new')
  end

  post '/users/new' do
    @user = User.new(email_address: params[:email_address],
                             password: params[:password],
                password_confirmation: params[:password_confirmation])
    session[:user_name] = @user.email_address
    if @user.save
      session[:user_id] = @user.id
      redirect '/home'
    else
      flash.now[:notice] = "password mismatch, re-enter password"
      erb(:'users/new')
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/home')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  run! if app_file == $0
end
