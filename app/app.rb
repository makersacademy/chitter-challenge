require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'models/peep'

ENV["RACK_ENV"] ||= 'development'

class ChitterChallenge < Sinatra::Base
  get '/' do
   redirect to('/peeps')
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
