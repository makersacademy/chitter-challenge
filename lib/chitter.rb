require 'sinatra/base'

class Chitter < Sinatra::Base

set :public_folder, File.dirname(__FILE__)

  get '/' do
    'Hello Chitter!'
  end

  get '/signup' do
    erb :signup
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
