require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep.rb'
require './lib/user.rb'
require './lib/database_connection.rb'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    @peeps = Peep.all
    @user = User.find(session[:user_id])
    erb(:index)
  end

  get '/users/new' do
    erb(:'users/new')
  end

  get '/users/log_in' do
    erb(:'users/log_in')
  end

  post '/peep/add' do
    @user = User.find(session[:user_id])
    Peep.add(params[:text], @user.id, @user.username)
    redirect '/'
  end

  post '/users/create' do
    user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect '/'
    else
      flash[:notice] = 'That username or email is already in use, please choose another one'
      redirect('/users/new')
    end
  end

  post '/users/authenticate' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect('/')
    else
      flash[:notice] = 'Incorrect email or password'
      redirect('/users/log_in')
    end
  end

  post '/users/log_out' do
    session.clear
    flash[:notice] = 'You have signed out'
    redirect('/')
  end

  run! if app_file == $PROGRAM_NAME
end
