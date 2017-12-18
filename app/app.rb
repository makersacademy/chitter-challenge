ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class ChitterChatter < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'keep it secret'

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email],
                       password: params[:password])
    session[:user_id] = user.id
    redirect to('/peeps')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    p params
    user = User.authenticate(params[:email], params[:password])
    p user
    if user
      session[:user_id] = user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end


  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/post' do
    erb :'peeps/post'
  end

  post '/peeps' do
    peep = Peep.create(title: params[:title], content: params[:content])
    peep.save
    redirect '/peeps'
  end
end
