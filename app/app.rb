ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'models/user'
require_relative 'models/peeps'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  use Rack::MethodOverride
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    @peeps = Peep.all
    erb(:index)
  end

  get '/sign_up' do
    erb(:sign_up)
  end

  post '/create_user' do
    @user = User.create(name: params[:name], email: params[:email], username: params[:username], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect('/home')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb(:sign_up)
    end
  end

  get '/home' do
    @peeps = Peep.all
    erb(:home)
  end

  get '/login_form' do
    erb(:login_form)
  end

  post '/login' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect('/home')
    else
      flash.now[:errors] = ['Username or Password is incorrect']
      erb(:login_form)
    end
  end

  delete '/signout' do
    session[:user_id] = nil
    flash.keep[:notice] = "Thank you for visiting Chitter"
    redirect('/')
  end

  get '/peep' do
    erb(:peep)
  end

  post '/create_peep' do
    user = current_user
    time = DateTime.now
    peep = Peep.create(name: user.name, username: user.username, peep: params[:peep], time: time)
    user.peeps << peep
    user.save
    redirect('/home')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
end
