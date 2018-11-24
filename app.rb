require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'
require_relative './database_connection_setup'
require_relative './lib/user'

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    # "Timeline"
    p params
    @user = User.find(id: session[:user_id])
    @peeps = Peep.all
    erb :"chitter/index"
  end

  get '/peeps' do
    @user = User.find(id: session[:user_id])
    @peeps = Peep.all
    erb :"peeps/index"
  end

  post '/peeps' do
    @peeps = Peep.create(
      message: params[:message],
      created_at: Time.now
    )
    redirect '/peeps'
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  get '/chitter' do
    @peeps = Peep.all
    erb :"chitter/index"
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.create(
      name: params['name'],
      email: params['email'],
      password: params['password']
    )
    session[:user_id] = user.id
    redirect '/peeps'
  end

  post '/users/new' do
    user = User.create(
      name: params['name'],
      email: params['email'],
      password: params['password']
    )
    session[:user_id] = user.id
    redirect '/peeps'
  end

  get '/sessions' do
    p params
    erb :"sessions/new"
  end

  post '/sessions/new' do
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{params[:name]}', '#{params[:email]}'")
    user = User.new(result[0]['id'], result[0]['email'], result[0]['password'])

    session[:user_id] = user.id
    redirect('/peeps')
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])

    if user
      session[:user_id] = user.id
      redirect('/peeps')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/sessions/new')
    end
  end

  run! if app_file == $0
end
