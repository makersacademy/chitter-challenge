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
    @session_id = session[:id]
    @session_user = session[:user_name]
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

  get '/session/logout' do
    clear_session_info
    flash[:message] = 'Logged out. See you again soon.'
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

  run! if app_file == $0
end
