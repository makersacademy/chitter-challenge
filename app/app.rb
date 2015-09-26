require 'sinatra/base'
require './app/data_mapper_setup'

class Chitter < Sinatra::Base
  run! if app_file == $PROGRAM_NAME

  set :views, proc { File.join(root, 'views') }

  enable :sessions

  get '/' do
    erb :index
  end

  post '/user' do
    User.create(email: params[:email], password: params[:password],
    name: params[:name], username: params[:username])
    redirect :'/user'
  end

  get '/user' do
    @user = User.first
    erb :'user/index'
  end

end
