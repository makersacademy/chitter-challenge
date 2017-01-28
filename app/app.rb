require 'sinatra/base'
require_relative 'models/chitter_user'

class Chitter < Sinatra::Base
  get '/' do
    'Hello Chitter! please go to signup'
  end

  get '/signup' do
    erb :signup_page
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
