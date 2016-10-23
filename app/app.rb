require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'models/peep'
require_relative 'models/user'

ENV["RACK_ENV"] ||= "development"

class ChitterChallenge < Sinatra::Base
  get '/' do
    redirect to('/peeps')
  end

  enable :sessions
  set :session_secret, 'super secret'

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'/peeps/new'
  end

  post '/peeps' do
    Peep.create(author: params[:author], comment: params[:comment],
    created: Time.now)
    redirect to('/peeps')
  end

  get '/users/new' do
    erb :'/users/new'
  end

  post '/users' do
    user = User.create(username: params[:username], password: params[:password])
    session[:user_id] = user.id
    redirect to('/peeps')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
