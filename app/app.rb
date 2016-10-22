ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/peep'

class ChitterChallenge < Sinatra::Base
get '/' do
  "Hello ChitterChallenge World!!!"
  redirect '/peeps/new'
end

get '/peeps' do
  @peeps = Peep.all
  erb :'peeps/index'
end

get '/peeps/new' do
  erb :'peeps/new'
end

  #run! if app_file == $0
end
