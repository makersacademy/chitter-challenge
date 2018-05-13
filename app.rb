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
    erb :user_new
  end

  post '/user/new' do
    user = User.create(:email => params['email'], :user_name => params['user_name'])
    save_session_info(user)
    flash[:message] = "Welcome #{session[:user_name]}"
    redirect '/'
  end

  post '/user/login' do
    user = User.first(:email => params['login_email'])
    save_session_info(user)
    flash[:message] = "Welcome back #{session[:user_name]}"
    redirect '/'
  end

  get '/peep/new' do
    erb :peep_new
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

  run! if app_file == $0
end
