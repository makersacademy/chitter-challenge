require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/user'
require_relative './lib/peep'
require_relative './lib/feed'
require_relative 'connection_setup'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/chitter/account/new' do
    erb :'account/new'
  end

  post '/chitter/account/login' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect "/chitter/account/#{params[:username]}"
    else
      flash[:login] = 'Incorrect email or password. Please double-check and try again.'
      redirect "/"
    end
  end

  post '/chitter/account/new' do
    if User.exists?('username', params[:username])
      flash[:username] = 'This username is already in use.'
      redirect "/chitter/account/new"
    elsif User.exists?('email', params[:email])
      flash[:email] = 'This email address is already in use.'
      redirect "/chitter/account/new"
    else
      user = User.create(params[:username], params[:email], params[:password], params[:full_name])
      session[:user_id] = user.id
      redirect "/chitter/account/#{params[:username]}"
    end
  end

  get '/chitter/account/:username' do
    @user = User.find(session[:user_id])
    @feed = Feed.all
    erb :'account/feed'
  end

  post '/chitter/account/:username/post_peep' do
    peep = Peep.create(params[:peep_body])
    user = User.find(session[:user_id])
    Feed.add(user, peep)
    redirect "/chitter/account/#{params[:username]}"
  end

  post '/chitter/logout' do
    session.clear
    flash[:logout] = 'You have signed out.'
    redirect('/')
  end

  run! if app_file == $0
end
