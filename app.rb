require 'sinatra/base'
require 'sinatra/flash'

require './lib/model_router.rb'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  use Rack::MethodOverride

  before do
    @message = flash[:message]
    @peeps = Peep.all
  end

  get '/' do
    erb :index
  end

  get '/user/new' do
    erb :'user/new'
  end

  post '/user/new' do
    new_user_check(params['email'], params['user_name'])

    user = User.create(:email => params['email'],
      :user_name => params['user_name'], :password => params['password'])
    save_session_info(user)
    flash[:message] = "Welcome #{session[:user_name]}"
    redirect '/'
  end

  get '/session/login' do
    erb :'session/login'
  end

  post '/session' do
    user = User.first(:user_name => params['user_name'], :password => params['password'])
    existing_user_check(user)

    save_session_info(user)
    flash[:message] = "Welcome back #{session[:user_name]}"
    redirect '/'
  end

  get '/peep/new' do
    erb :'peep/new'
  end

  post '/peep/new' do
    Peep.create(
      :message => params['post'],
      :created_at => DateTime.now,
      :user_id => session[:id]
    )
    flash[:message] = 'Peep posted'
    redirect '/'
  end

  def save_session_info(user)
    session[:id] = user.id
    session[:user_name] = user.user_name
  end

  def existing_user_check(user)
    if user == nil
      flash[:message] = "Sorry, the username and/or password was entered incorrectly."
      redirect '/session/login'
    end
  end

  def new_user_check(email, username)
    if User.first(:email => email) != nil
      flash[:message] = "Email address (#{email}) already used."
      redirect '/user/new'
    end
    if User.first(:user_name => username) != nil
      flash[:message] = "User name (#{username}) already taken."
      redirect '/user/new'
    end
  end

  run! if app_file == $0
end
