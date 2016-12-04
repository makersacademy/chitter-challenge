require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/sign-up' do
    erb :sign_up
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
