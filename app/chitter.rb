require './app/data_mapper_setup'
require './app/app_helpers'
require 'securerandom'
require 'sinatra/base'
require 'sinatra/partial'
require 'tilt/erb'


class Chitter < Sinatra::Base
  register Sinatra::Partial
  register Sinatra::Flash
  set :partial_template_engine, :erb
  enable :partial_underscores
  enable :sessions
  set :session_secret, 'super secret'
  use Rack::MethodOverride
  include Helpers

  get '/' do
    redirect '/chits'
  end

  get '/chits' do
    @chits =  Chit.all.sort_by(&:time).reverse
    erb :'chits/view'
  end

  post '/chits' do
    chit = new_chit
    chit.save
    redirect '/chits'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users/new' do
    @user = new_user
    if @user.save
      session[:user_id] = @user.id
    else
      flash[:errors] = @user.errors.full_messages
    end
    redirect '/chits'
  end

  get '/sessions/new' do
    redirect '/chits'
  end

  post '/sessions/new' do
    user = authenticate_user
    if user
      session[:user_id] = user.id
    else
      flash.next[:errors] = ['The email or password is incorrect']
    end
    redirect '/chits'
  end

  delete '/sessions' do
    session[:user_id] = nil
    redirect '/chits'
  end

  run! if app_file == $PROGRAM_NAME
end
