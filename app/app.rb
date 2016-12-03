ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions

  use Rack::MethodOverride

  get '/' do
    "Hello"
  end

  get '/users/new' do
    @user = User.new
    erb :'/users/new'
  end

  post '/users' do
    user = User.new(email: params[:email], name: params[:name], username: params[:username], password: params[:password])
    if user.save
      session[:user_id] = user.id
      redirect '/peeps'
    end
  end

  get '/session/new' do
    @user = User.new
    erb :'/session/new'
  end

  post '/session' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    end
  end

  delete '/session' do
    session[:user_id] = nil
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'/peeps/peeps'
  end

  get '/peeps/new' do
    erb :'/peeps/new'
  end

  post '/peeps' do
    if current_user
      peep = Peep.create(message: params[:message])
      redirect '/peeps'
    else
      redirect '/'
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0

end
