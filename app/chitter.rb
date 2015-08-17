require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'helpers/application_helper'
class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, '8h2e9h%$@##&#@&$)^@#ADIZdfgwd'

  use Rack::MethodOverride

  get '/' do
    redirect to('/peeps')
  end

  get '/peeps' do
    @peeps = Peep.all.reverse
    erb :'peeps/index'
  end

  post '/peeps' do
    user = current_user
    peep = user.peeps.create(content: params[:new_peep])
    redirect to('/peeps')
  end

  get '/users/new' do
    @user = User.new  # nb: this is to store the values in the form in case of unsuccessful registration
    erb :'users/new'
  end

  post '/users' do
    user = User.create(username: params[:username], name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect to('/peeps')
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/peeps')
    else
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    redirect to('/peeps')
  end


  ###########################################

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
