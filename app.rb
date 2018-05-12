require 'sinatra/base'
require 'sinatra/flash'

require './lib/user.rb'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  use Rack::MethodOverride

  before do
    @message = flash[:message]
    @user = session[:user]
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

  run! if app_file == $0
end
