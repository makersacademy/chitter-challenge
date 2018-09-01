require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/send_peep' do
    erb :send_peep
  end

  post '/send_peep' do
    erb :send_peep
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
