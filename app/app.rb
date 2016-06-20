ENV["RACK_ENV"] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'Data_mapper_setup'
require_relative 'models/peep'
require_relative 'models/user'


class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  helpers do
  	def current_user
  	  @current_user ||= User.get(session[:user_id])
  	end
  end

  get '/' do
  	redirect :'sessions/new'
  end

  get '/peeps' do
  	@peeps = Peep.all(:order => [:created_at.desc])
  	erb :'peeps/index'
  end

  get '/peeps/new' do
  	erb :'peeps/new'
  end

  post '/peeps' do
  	peep = Peep.create(peep: params[:peep])
  	peep.user = current_user
  	peep.save
  	redirect '/peeps'
  end

  get '/users/new' do
  	@user = User.new
  	erb :'users/new'
  end

  post '/users' do
  	@user = User.new(name: params[:name],
  				     handle: params[:handle],
  				     email: params[:email],
  				     password: params[:password],
  				     password_confirmation: params[:password_confirmation])
  	if @user.save
  	  session[:user_id] = @user.id
  	  redirect '/peeps'
  	else
  	  flash.now[:errors] = @user.errors.full_messages	
  	  erb :'users/new'
  	end
  end

  get '/sessions/new' do
  	erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect 'peeps'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
  	session[:user_id] = nil
  	flash.keep[:notice] = 'goodbye!'
  	redirect '/peeps'
  end

  run! if app_file == $0
end