require 'sinatra/base'

class App < Sinatra::Base
  set :views, proc { File.join(root, '..', 'views') }
  
  get '/' do
    'Hello App!'
  end

  post '/' do
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
