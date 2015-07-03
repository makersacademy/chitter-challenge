require 'sinatra/base'
require 'data_mapper_setup'

class Chitter < Sinatra::Base
  set :views, proc { File.join(root, '.', 'views') }

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :'users/new'

  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
