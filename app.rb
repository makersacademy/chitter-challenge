ENV['RACK_ENV'] = 'test'
require 'sinatra/base'
require './lib/models/user'
require './lib/models/peep'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @peeps = Peep.all
    if session[:user] 
      erb :index_logged_in 
    else
      erb :index
    end
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    p params
    flash[:notice] = "Please enter a valid user" unless User.login(params[:login], params[:password])
    session[:user] = User.login(params[:login], params[:password])
    redirect '/'
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up/confirm' do
    p params
    flash[:notice] = "Your account has been created, please login" if User.create(username: params[:username], email: params[:email], name: params[:name], password: params[:password])
    # User.create(username: params[:username], email: params[:email], name: params[:name], password: params[:password])
    redirect '/'
  end

  get '/account' do
    erb :account
  end

  put '/account/:uid' do
  end

  run! if app_file == $0
end
