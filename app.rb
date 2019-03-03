require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/database_connection'
require_relative './lib/peep'
require_relative './lib/user'
require_relative './database_connection_setup'
require 'date'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/peeps' do
    @user = User.find(id: session[:user_id])
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    @user = User.find(id: session[:user_id])
    erb :"peeps/new"
  end

  post '/peeps' do
    user = User.find(id: session[:user_id])
    Peep.create(text: params['text'], posted_time: (Time.now).strftime("%d/%m/%Y %H:%M"), user_id: user.id)
    redirect '/peeps'
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    existing_email = User.find_by_email(email: params[:email])
    existing_username = User.find_by_username(username: params[:username])

    if !existing_email.num_tuples.zero?
      flash[:notice] = 'Email already existing. Please log in'
      redirect '/sessions/new'
    elsif !existing_username.num_tuples.zero?
      flash[:notice] = 'Username already in use.'
      redirect '/users/new'
    else
      user = User.create(name: params['name'], email: params['email'], username: params['username'], password: params['password'])
      session[:user_id] = user.id
      redirect '/peeps'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(email: params['email'], password: params['password'])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash[:notice] = 'Please check your email or password.'
      redirect '/sessions/new'
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = "You have signed out."
    redirect '/peeps'
  end
 run! if app_file == $0
end
