require 'sinatra/base'
require_relative 'lib/peep.rb'
require_relative 'lib/user.rb'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    @peeps = Peep.all
    @user = session[:user]
    erb :index, { :layout => :layout }
  end

  post '/' do
    session[:user] = User.create(user_name: params['name'],
      user_handle: params['user-handle'], email: params['email'],
      password: params['password'])
    if session[:user] == :email_clash || session[:user] == :handle_clash
      redirect '/'
    else
      redirect '/user'
    end
  end

  get '/user' do
    @peeps = Peep.all
    @user = session[:user]
    erb :user, { :layout => :layout }
  end

  post '/user' do
    Peep.create(content: params['content'], user_id: session[:user].user_id)
    redirect '/user'
  end

  get '/log-in' do
    @error = session[:error]
    session[:error] = false
    erb :log_in, { :layout => :layout }
  end

  post '/log-in' do
    session[:user] = User.authenticate(email: params['email'], password: params['password'])
    if session[:user]
      redirect '/user'
    else
      session[:error] = true
      redirect '/log-in'
    end
  end

  get '/log-out' do
    session.clear
    erb :log_out, { :layout => :layout }
  end

  run! if app_file == $0

end
