ENV['RACK_ENV'] = 'development'
require 'sinatra/base'
ENV['RACK_ENV'] = 'development'

class Chitter < Sinatra::Base
   get '/' do
   end

   # start the server if ruby file executed directly
   run! if app_file == $0
end
