require './database_connection_setup'
require './lib/peep'
require './lib/user'
require 'sinatra'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  enable :method_override
  register Sinatra::Flash

  get '/' do
    @peeps = Peep.all
    @user = session[:user]
    erb :index
  end

  get '/peep/new' do
    erb :write_peep
  end

  get '/user/new' do
    erb :register
  end

  get '/session/new' do
    erb :login
  end

  post '/peep' do
    session[:user].nil? ? user = User.new : user = session[:user]
    Peep.create(text: params[:peep], user: user)
    redirect to '/'
  end

  post '/user' do
    if params[:password] != params[:confirm_password]
      flash[:notice] = 'Passwords do not match'
      redirect to '/user/new'

    elsif User.email_in_db?(params[:email])
      flash[:notice] = 'Email is already in use'
      redirect to '/user/new'

    elsif User.username_in_db?(params[:username])
      flash[:notice] = "Username already taken"
      redirect to '/user/new'

    else
      User.create(name: params[:name],
        username: params[:username],
        email: params[:email],
        password: params[:password]
      )
      flash[:notice] = 'Thank you for registering with Chitter. Login to start Peeping!'
      redirect to '/'
    end
  end

  post '/session' do
    user = User.authenticate(email: params[:email], password: params[:password])

    if user.nil?
      flash[:notice] = 'Incorrect email or password'
      redirect to '/session/new'
    else
      session[:user] = user
      redirect to '/'
    end
  end

  delete '/session' do
    session[:user] = nil
    redirect to '/'
  end

  run! if app_file == $0

end
