require 'sinatra/base'
require 'data_mapper'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  set :views, proc { File.join(root, "..", "views") }

  get '/' do
    @current_user = User.get(1)
    erb :index
  end

  post '/users' do
    User.create(name: params['Name'], email: params['Email'],
                username: params['Username'])
    erb :'users/new'
  end

  get '/users/all' do
    @users = User.all
    erb :'users/all'
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME

end
