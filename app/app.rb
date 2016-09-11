ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'

require_relative 'data_mapper_setup.rb'
require_relative 'helpers'



class ChitterChallenge < Sinatra::Base
  helpers Helpers

  use Rack::MethodOverride
  enable :sessions
  register Sinatra::Flash


  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
      peep = Peep.create(message: params[:message], time: Time.now)
      peep.user = current_user
      peep.save
      redirect '/peeps'
  end




  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(name: params[:name], username: params[:username],
    email: params[:email],
    password: params[:password],
    password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      @errors = @user.errors
      erb :'users/new'
    end
  end

  get '/users/log-in' do
    erb :'users/log-in'
  end

  post '/users/log-in' do
    authenticated_user = User.authenticate_user(params[:email], params[:password])
    if authenticated_user
      session[:user_id] = authenticated_user
      redirect '/peeps'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'/users/log-in'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'You have been successfully logged out'
    redirect to '/peeps'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
