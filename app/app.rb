require 'sinatra/base'

class Twitter < Sinatra::Base
  get '/' do
  end

  get '/twitter' do
    erb ':index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
