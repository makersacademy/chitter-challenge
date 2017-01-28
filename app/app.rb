ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/peeps' do
    erb :peeps
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
