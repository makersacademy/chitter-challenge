require 'sinatra/base'
require './data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :views, proc { File.join(root, 'views') }

  get '/' do
    'Hello Chitter!'
  end

  get '/users/new' do
    erb :'/users/new'
  end

  post '/users/new' do
    @user = User.create(email: params[:email], name: params[:name], password: params[:password], username: params[:username], password_confirmation: params[:password_confirmation])
    "Welcome #{@user.name}"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
