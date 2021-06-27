require 'sinatra/base'
require 'sinatra/flash'
require 'uri'
require 'sinatra/reloader'
require './lib/peep'
require './lib/user'
require './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Peeps'
  end

  get '/peeps' do
    @user = User.find(user_id: session[:user_id])
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    @user = User.find(user_id: session[:user_id])
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(peep_text: params[:message])
    redirect '/peeps'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    # This if statement never actually runs in live, only for capybara feature tests - see test.
    if params.values.all? { |x| x.empty? }
      flash[:notice] = "Please check the required fields."
      redirect '/users/new'
    end

    user = User.create(email: params[:email], password: params[:password], name: params[:name], username: params[:username])
    
    if user.nil?
      flash[:notice] = "An account with that email already exists."
      redirect('/users/new')
    elsif user == false
      flash[:notice] = "That username is already taken."
      redirect('/users/new')
    elsif user
      session[:user_id] = user.user_id
      redirect '/peeps'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])

    if user
      session[:user_id] = user.user_id
      redirect('/peeps')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/sessions/new')
    end
  end

  post '/sessions/destroy' do
    session.clear
    redirect('/peeps')
  end

  run! if app_file == $0
end
