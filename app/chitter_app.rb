ENV['RACK_ENV'] = 'development'

require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    redirect to('/welcome_page')
  end

  get '/welcome_page' do
    erb :welcome_page
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
