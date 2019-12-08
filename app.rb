require 'sinatra/base'
require_relative 'lib/peep.rb'
require_relative 'lib/user.rb'

class Chitter < Sinatra::Base

  enable :sessions

  get '/chitter' do
    @peeps = Peep.all
    erb :index
  end

  post '/chitter' do
    session[:user] = User.create(user_name: params['name'],
      user_handle: params['user-handle'], email: params['email'],
      password: params['password'])
    redirect '/chitter/user'
  end

  get '/chitter/user' do
    @peeps = Peep.all
    @user = session[:user]
    erb :'chitter/user'
  end

  post '/chitter/user' do
    Peep.create(content: params['content'], user_id: session[:user].user_id )
    redirect '/chitter/user'
  end

  get '/chitter/sign-in' do
    @error = session[:error]
    session[:error] = false
    erb :'chitter/sign_in'
  end

  post '/chitter/sign-in' do
    session[:user] = User.authenticate(email: params['email'], password: params['password'])
    redirect '/chitter/user'
  rescue RuntimeError
    session[:error] = true
    redirect '/chitter/sign-in'
  end

  get '/chitter/log-out' do
    session.clear
    erb :'chitter/log_out'
  end

  run! if app_file == $0

end
