require 'sinatra/base'
require './app/models/peep'
require 'data_mapper'
require './app/data_mapper_setup.rb'
require 'sinatra/flash'

class App < Sinatra::Base

  enable :sessions
  register Sinatra::Flash
  use Rack::MethodOverride
  set :session_secret, 'super secret'

  get '/' do
    redirect '/peep'
  end

  get '/peep' do
    @peeps = Peep.all
    erb :index
  end

  post '/peep' do
    @peep = Peep.create(peep: params[:peep])
    @peep.save
    redirect to('/peep')
  end

  get '/peep/new' do
    erb :new
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation],
                name: params[:name],
                username: params[:username])
    if @user.save
      session[:user_id] = @user.id
      redirect('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email],
                             password: params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/peep')
    else
      flash[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    flash[:notice] = ['goodbye!']
  end

  def current_user
    User.get(session[:user_id])
  end
end
