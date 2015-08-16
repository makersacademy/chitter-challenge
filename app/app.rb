require 'sinatra/base'
require './data_mapper_setup'


class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

    get '/' do
      redirect '/peeps'
    end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps' do
    if session[:user_id] == nil
      redirect to ('/users/new')
    else
      peep = Peep.new(message: params[:message], name: params[:email], username: params[:username], timestamp: Time.now)
      peep.save
      redirect to('/peeps')
    end
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(email: params[:email],
                password: params[:password],
                username: params[:username])
    @user.save
    session[:user_id] = @user.id
    redirect to('/peeps')
  end

  helpers do
    def current_user
      current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end