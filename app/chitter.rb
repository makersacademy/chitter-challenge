ENV['RACK_ENV'] ||= 'development'

require 'sinatra'
require 'time_ago_in_words'
require_relative 'data_mapper_setup'
require_relative 'helpers'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, "you'll never guess it!"

  helpers Helpers

  get '/' do
    "Welcome to Chitter"
  end

  get '/chits' do
    @chits = Chit.all(:order => [ :time.desc ])
    erb :'chits/index'
  end

  get '/chits/new' do
    erb :'chits/new'
  end

  post '/chits' do
    Chit.create(message: params[:message],
               time: Time.now)
    redirect '/chits'
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    user = User.create(username: params[:username],
               email: params[:email],
               password: params[:password])
    session[:user_id] = user.id
    redirect '/chits'
  end

  run! if $PROGRAM_NAME == __FILE__
end
