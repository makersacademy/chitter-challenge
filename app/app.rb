ENV['RACK_ENV'] ||= 'development'
# ENV['RACK_ENV'] ||= 'test'

require 'sinatra'
require 'sinatra/base'


class Chitter < Sinatra::Base

get '/' do
 "Home Page"
end


  # run if file is run directly by Ruby
  run! if app_file == $0

end
