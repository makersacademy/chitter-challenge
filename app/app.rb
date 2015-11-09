ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require_relative 'models/user'
require_relative 'models/peep'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  use Rack::MethodOverride

  enable 'sessions'
  set :secret_session, 'secrets'

  get '/' do
    erb :homepage
  end

  get '/signup' do
    @user = User.new
    erb :sign_up
  end

  post '/signup' do
    @user = User.create(name: params[:name], username: params[:username], email:
    params[:email], password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :sign_up
    end
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  post '/signin' do
    user = User.authenticate(params[:email], params[:password])
    if user
      flash[:notice] = 'Sign in successful'
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :homepage
    end
  end

  delete '/signout' do
    session[:user_id] = nil
    flash.keep[:notice] = 'You have successfully logged out'
    redirect '/peeps'
  end

  post '/peeps' do
    peep = Peep.create(peep: params[:peep])
    redirect 'peeps'
  end


  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end

  run! if app_file == $0
end
