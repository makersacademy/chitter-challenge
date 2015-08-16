require 'sinatra/base'
require_relative '../data_mapper_setup'

class Chitter_Challenge < Sinatra::Base

  helpers do
  def current_user
    @current_user ||= User.get(session[:user_id]) if session[:user_id]
  end
end

  enable :sesssions
  set :session_secret, 'super secret'

  get '/' do
    'Hello, welcome to chitter'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new_peeps'
  end

  post '/peeps' do
    Peep.create(user: params[:user], peeps: params[:peeps])
    redirect to('/peeps')
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:name],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    session[:user_id] = user_id
    redirect to('/peeps')
    erb :'users/new'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
