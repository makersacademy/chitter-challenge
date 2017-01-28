require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    'Hello Chitter!'
  end

  get '/signup' do
    erb :signup_page
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
