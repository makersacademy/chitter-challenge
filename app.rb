require 'sinatra/base'
require './lib/chitter.rb'
require './lib/user.rb'

class ChitterWebApp < Sinatra::Base

  enable :sessions, :method_override
  set :raise_errors, true

  before { @user = User.current }

  get '/' do
    @peeps = Chitter.all
    erb :index
  end

  post '/peep/new' do
    Chitter.add(text: params[:new_peep], id: User.current.id)
    redirect '/'
  end

  get '/login' do
    erb :login
  end

  get '/logout' do
    User.log_out
    redirect '/'
  end

  post '/login' do
    User.sign_in(params[:username], params[:password])
    redirect '/'

  end

  get '/users/new' do
    erb :new
  end

  post '/users' do
    User.add(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    # User.set_current(name: params[:name], username: params[:username])
    redirect '/'
  end

  get '/tags/:tag' do
    @header = '#' + params[:tag]
    @peeps = Chitter.by_tag(@header)
    erb :results
  end

  get '/users/:username' do
    @header = '@' + params[:username]
    @peeps = Chitter.by_user(params[:username])
    erb :results
  end

  error AlreadyRegisteredError do
    session[:error] = 'register'
    # redirect '/login'
  end

  error LogInError do
    session[:error] = 'login'
    
    redirect '/login'
  end

  run! if app_file == $0
end
