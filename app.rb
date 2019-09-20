require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/peep'
require_relative './lib/user'
require_relative 'lib/database_connection_setup'

class Chitter < Sinatra::Base

  register Sinatra::Flash
  enable :sessions, :method_override

  get '/' do
    @user = User.get(session[:user_id])
    @peeps = Peep.all(:order => [:creation_time.desc])
    erb :index
  end

  post '/peep' do
    user = User.get(session[:user_id])
    Peep.create(content: params[:peep], creation_time: Time.now, user: user)
    redirect '/'
  end

  get '/users/new' do
    erb :signup
  end

  post '/users' do
    if !User.first(email: params[:email]).nil?
      flash[:email_already_exists] = 'email already exists: please log in or try again'
      redirect '/users/new'
    elsif !User.first(username: params[:username]).nil?
      flash[:username_not_unique] = 'username already exists: please choose another'
      redirect '/users/new'
    elsif params[:email].empty? || params[:username].empty? || params[:password].empty? || params[:name].empty?
      flash[:empty_field] = 'please complete all fields'
      redirect '/users/new'
    else
      user = User.create(email: params[:email], password: params[:password], name: params[:name], username: params[:username])
      session[:user_id] = user.id
      redirect '/'
    end
  end

  get '/sessions/new' do
    erb :login
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user.nil?
      flash[:incorrect_details] = 'incorrect email or password: please try again or sign up'
      redirect '/sessions/new'
    else
      session[:user_id] = user.id
      redirect '/'
    end
  end

  delete '/session/delete' do
    session[:user_id] = nil
    redirect '/'
  end

  run! if app_file == $0
end
