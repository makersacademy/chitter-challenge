ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'models/peep'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/peeps' do
    @peeps = Peep.all
    erb :'/peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(title: params[:title], message: params[:message])
    redirect '/peeps'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email],
              password: params[:password])
    session[:user_id] = user.id
    redirect '/peeps'
  end

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end

end
