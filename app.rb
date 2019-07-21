require 'sinatra/base'
require_relative './lib/database_connection_setup'
require_relative './lib/chitter'
require_relative './lib/User'

class ChitterApp < Sinatra::Base

  configure do
    enable :session
  end

  get '/' do
    @current_user = Chitter.user
    @peeps = Chitter.list
    erb :index
  end

  post '/peeps/new' do
    Chitter.create(params[:body])
    redirect('/')
  end

  get '/user/register' do
    erb :register
  end

  post '/user/create' do
    current_user = User.create(params[:username], params[:email], params[:password])
    Chitter.log_in(current_user.email, current_user.password)
    redirect('/')
  end

  post '/user/log_in' do
    Chitter.log_in(params[:email], params[:password])
    redirect('/')
  end

  get '/user/log_out' do
    Chitter.log_out
    redirect('/')
  end

  get '/reset' do
    Chitter.reset_yoself
    redirect('/')
  end
end
