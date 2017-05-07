ENV['RACK_ENV'] ||= 'development'

require_relative 'data_mapper_setup'
require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :news_feed
  end

  get '/peeps/index' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(username: @current_user, content: params[:content])
    redirect '/peeps/index'
  end

  get '/home' do
    @users = User.all
    erb :news_feed
  end

  get '/sign-up' do
    erb :'users/new', :layout => false
  end

  post '/sign-up' do
    user = User.create(email: params[:email], name: params[:name], username: params[:username], password: params[:password])
    session[:user_id] = user.id
    redirect to '/home'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end
