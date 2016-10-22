ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'

class ChitterChallenge < Sinatra::Base
get '/' do
  "Hello World"
end

get '/peeps' do
  "Hello Peeps"
end

  #run! if app_file == $0
end
