require 'sinatra/base'
require './data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  set :view, proc { File.join(root, 'view')}

  get '/' do
    'Hello Chitter!'
  end

  get '/user/new' do
  	erb :'/user/new'
  end

  post '/user/new' do
  	user = User.create(email: params[:email], username: params[:username], password: params[:password], password_confirmation: params[:password_confirmation])
  	user.save
    "Welcome to Chitter!"
  end

  get '/cheets' do
    @cheets = Cheets.all
  	erb :'/cheets/index'
  end

  get '/cheets/new' do
    erb :'/cheets/new'
  end

  post '/cheets' do
  	cheets = Cheets.new(message: params[:message], time: DateTime.now)
    cheets.save
  	redirect to('/cheets')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
