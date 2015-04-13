require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'
require 'bcrypt'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  set :views, proc { File.join(root, "..", "views") }

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id]) if session[:user_id]
    end

    def authenticate(user, password)
      user && BCrypt::Password.new(user.password) == password
    end
  end

  enable :sessions

  get '/' do
    erb :index
  end

  post '/users/new' do
    user = User.create(name: params['Name'], email: params['Email'],
                       username: params['Username'],
                       password: BCrypt::Password.create(params['Password']))
    if user.save
      session[:user_id] = user.id
      @current_user = User.get(session[:user_id])
    end
    erb :'users/new'
  end

  get '/users/all' do
    @users = User.all
    erb :'users/all'
  end

  post '/users/logout' do
    session[:user_id] = nil
    redirect to('/')
  end

  post '/users/login' do
    user = User.first(username: params['Login_username'])
    if authenticate(user, params['Login_password'])
      session[:user_id] = user.id
      @current_user = User.get(session[:user_id])
      redirect to('/')
    else
      erb :'users/invalid'
    end
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps/create' do
    peep = Peep.create(title: params['Title'], body: params['Body'],
                       user_id: current_user.id)
    if peep.save
      redirect('/peeps/all')
    else
      redirect('/peeps/new')
    end
  end

  get '/peeps/all' do
    @peeps = Peep.reverse_chronological
    @users = User.all
    erb :'peeps/all'
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME

end
