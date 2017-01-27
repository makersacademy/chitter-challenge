
ENV["RACK_ENV"] ||= "development" # ensures app runs in development mode by default

require 'sinatra/base'

class ChitterChallenge < Sinatra::Base


  # start the server if ruby file executed directly
  run! if app_file == $0

end
