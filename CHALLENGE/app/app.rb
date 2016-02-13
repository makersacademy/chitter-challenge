require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    redirect '/homepage'
  end
  get '/homepage' do
    erb :homepage
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
