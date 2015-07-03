require 'sinatra/base'
require './app/data_mapper_setup.rb'
require 'pry'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  run! if app_file == $0
  enable :sessions
  register Sinatra::Flash
  use Rack::MethodOverride


  get '/' do
    redirect 'peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(full_name: params[:full_name],
                        email: params[:email],
                        username: params[:username],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/sign_in' do
    erb :'users/sign_in'
  end

  post '/sign_in' do

    user = User.authenticate(username: params[:username], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'users/sign_in'
    end
  end

  delete '/sign_out' do
    session[:user_id] = nil
    flash[:notice] = 'Goodbye!'
    redirect to('/peeps')
  end

  helpers do
    def current_user
       @current_user ||= User.get(session[:user_id])
     end
  end

end
