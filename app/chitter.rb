require 'sinatra/base'
require_relative 'data_mapper_setup'
class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :'users/new'
  end

  get '/peeps/new' do
    erb :new
  end

  get '/peeps' do
    @peeps = Peep.all(order: [:created_at.desc])
    erb :timeline
  end

  post '/peeps' do
    peep = Peep.new(message: params[:content])
    peep.save
    redirect to('/peeps')
  end

  get '/users/new' do
    erb :'/users/new'
  end

  post '/users' do
    user = User.create(user_name: params[:username], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect to('/peeps')

  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
end
