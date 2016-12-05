ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  use Rack::MethodOverride

  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'


    helpers do
      def current_user
        @current_user ||= User.get(session[:user_id])
      end
    end

  post '/users' do
    @user = User.create(email: params[:email],
      password: params[:password],
      name: params[:name],
      username: params[:username],
      password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/users/new' do
    session[:user_id] = nil
    @user = User.create
    erb :'users/new'
  end

  get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  @user = User.authenticate(params[:email], params[:password])
  if @user
    session[:user_id] = @user.id
    redirect to('/peeps')
  else
    flash.now[:errors] = ['The email or password is incorrect']
    erb :'sessions/new'
  end
end

delete '/sessions' do
  session[:user_id] = nil
  flash.keep[:notice] = 'till next time, goodbye!'
  redirect to '/peeps'
end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end


  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    time = Time.now.strftime("%H:%M:%S")
    peep = Peep.create(time: time, message: params[:message])
    current_user.peeps << peep
    current_user.save
    redirect '/peeps'
  end

  get '/' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  run! if app_file == $0

end
