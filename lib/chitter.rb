require 'sinatra/base'
require './lib/data_mapper_setup'

class Chitter < Sinatra::Base

  set :views, proc { File.join(root, 'views') }

  get '/' do
    'Hello Chitter!'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    User.create(email: params[:email], password: params[:password])
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
