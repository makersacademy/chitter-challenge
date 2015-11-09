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

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end

  get '/' do
    erb :index
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users/new' do
    @user = User.create(name: params[:name],
                        username: params[:username],
                        email: params[:email],
                        password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect ('/peeps/index')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end



  post '/sessions/new' do
    user = User.authenticate(params[:email], params[:password])
    if user
      flash[:notice] = 'Sign in successful'
      session[:user_id] = user.id
      redirect ('/peeps/index')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :homepage
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'You have successfully logged out'
    redirect ('/peeps/index')
  end

  get '/peeps/index' do
    redirect('/sessions/new') if session[:user_id].nil?
    @user ||= User.get(session[:user_id])
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps/new' do
    new_peep = Peep.create(body: params[:body])
    current_user.peeps << new_peep
    current_user.save
    redirect ('/peeps/index')
  end




  run! if app_file == $0
end
