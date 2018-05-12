require 'sinatra/base'
require 'sinatra/flash'

require './lib/model_router.rb'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  use Rack::MethodOverride

  before do
    @message = flash[:message]
    @user = session[:user]
    @peeps = Peep.all
  end

  get '/' do
    erb :index
  end

  get '/user/new' do
    erb :user_new
  end

  post '/user/new' do
    user = User.create(:email => params['email'])
    flash[:message] = "Welcome #{params['email']}"
    session[:user] = user.id
    redirect '/'
  end

  post '/user/login' do
    flash[:message] = "Welcome back #{params['login_email']}"
    session[:user] = params['email']
    redirect '/'
  end

  get '/peep/new' do
    erb :peep_new
  end

  post '/peep/new' do
    Peep.create(
      :message => params['post'],
      :user_name => session[:user],
      :created_at => DateTime.now
    )
    flash[:message] = 'Peep posted'
    redirect '/'
  end

  run! if app_file == $0
end
