ENV["RACK_ENV"] ||= "development"
require 'sinatra/partial'
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'


class Chitter < Sinatra::Base

  use Rack::MethodOverride
  enable :sessions
  set :session_secret, 'super secret'
  enable :partial_underscores
  register Sinatra::Flash
  register Sinatra::Partial
  set :partial_template_engine, :erb

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps= Peep.all
    erb :'peeps/peeps'
  end

  get '/peeps/new' do
    if current_user
      erb(:'peeps/new')
    else
      redirect('/')
    end

  end

  post '/peeps' do
    peep= Peep.create(peep: params[:peep])
    current_user.peeps << peep
    current_user.save
    redirect '/peeps'
  end

  get '/sign_up' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user= User.new(
      name: params[:name],
      user_name: params[:user_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation])

    if @user.save
      session[:user_id] = @user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'/users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'goodbye!'
    redirect to '/peeps'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
