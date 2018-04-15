require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/peep.rb'
require_relative './lib/user.rb'

class Chitter < Sinatra::Base
  set :session_secret, 'secret'
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @peeps = Peep.all
    erb :home
  end

  get '/users/new' do
    erb :sign_up
  end

  get '/users/log_in' do
    erb :log_in
  end

  post '/users/new' do
    user = User.add(params['username'],params['name'],params['email'],params['password'])
    session[:user_id] = user[0]['id']
    session[:username]= user[0]['username']
    session[:name]= user[0]['name']
    redirect '/peeps/user'
  end

  post '/users' do
    user = User.authenticate(params['username'],params['password'])
    if user != nil
      session[:username]= user[0]['username']
      session[:name]= user[0]['name']
      redirect '/peeps/user'
    else
      flash[:notice] = 'Please check your username or password.'
      redirect '/users/log_in'
    end
  end

  get '/peeps/user' do
    @peeps = Peep.by(session[:username])
    @username = session[:username]
    @name = session[:name]
    erb :user_home
  end

  post '/peeps/user' do
    @peeps = Peep.by(session[:username])
    @username = session[:username]
    @name = session[:name]
    Peep.add(@username,@name,params['peep'])
    redirect '/peeps/user'
  end

  get '/logout' do
    session[:username] = nil
    redirect '/'
  end

end
