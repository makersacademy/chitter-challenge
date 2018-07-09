require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'
require './lib/user'
require 'uri'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :sign_up
  end

  post '/users/new' do
    User.add(params['username'], params['name'], params['email'], params['password'])
    redirect '/'
  end

  get '/users/login' do
    erb :log_in
  end

  post '/users' do
    user = User.authenticate(params['username'], params['password'])
    if user != nil
      session[:username] = user[0]['username']
      session[:name] = user[0]['name']
      redirect '/peeps/users'
    else
      flash[:notice] = 'Invalid username or password'
      redirect '/users/login'
    end
  end

  get '/peeps/users' do
    @peeps = Peep.reverse(session[:username])
    @username = session[:username]
    @name = session[:name]
    erb :home
  end

  post '/peeps/users' do
    @username = session[:username]
    @name = session[:name]
    Peep.add(@username, @name, params['message'])
    @peeps = Peep.reverse(session[:username])
    redirect '/peeps/users'
  end

  run! if app_file == $0
end
