ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'data_mapper_setup'

class ChitterChatter < Sinatra::Base
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

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/post' do
    erb :'peeps/post'
  end

  post '/peeps' do
    peep = Peep.new(title: params[:title], content: params[:content])
    peep.save
    redirect '/peeps'
  end
end
