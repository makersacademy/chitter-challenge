ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/peep'

class ChitterChallenge < Sinatra::Base
get '/' do
  "Hello World"
end

get '/peeps' do
  @peeps = Peep.all
  erb :'peeps/index'
end

  #run! if app_file == $0
end
