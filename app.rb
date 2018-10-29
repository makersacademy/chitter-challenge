require 'sinatra/base'
require 'sinatra/flash'
require './lib/chitter'
require './lib/user'

class App < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    @peeps = Chitter.all
    erb(:index)
  end

  post '/peep/new' do
    Chitter.create_peep(params[:name], params[:username], params[:peep])
    redirect to('/')
  end

  get '/users/new' do
    erb(:sign_up)
  end

  post '/users/sign_up' do
    @user = User.create(params[:name], params[:username], params[:email], params[:password])
    if @user
      session[:current_user] = @user
      redirect to('/user/logged_in')
    else
      flash[:notice] = 'That username is already in use, please choose another'
      redirect to('/users/new')
    end
  end

  post '/users/authenticate' do
    @user = User.authenticate(params[:username])
    @current_user = User.find_details(params[:username])
    if @current_user
      session[:current_user] = @current_user[0]
      redirect to('/user/logged_in')
    else
      flash[:notice] = 'You have entered an invalid username, try again!'
      redirect to('/user/log_in')
    end
  end

  get '/user/logged_in' do
    @peeps = Chitter.all
    @user = session[:current_user]
    erb(:logged_in)
  end

  post '/user/wall' do
    @user = session[:current_user]
    Chitter.all
    Chitter.create_peep(@user.name, @user.username, params[:peep])
    redirect to('/user/logged_in')
  end

  get '/user/log_in' do
    erb(:enter_log_in)
  end

  run! if app_file == $0
end
