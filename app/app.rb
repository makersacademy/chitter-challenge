ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/chit'
require_relative 'data_mapper_setup'


class ChitterChallenge < Sinatra::Base
  get '/' do
    erb :'index'
  end

  get '/chits' do
    @chits = Chit.all
    erb :'chits/index'
  end

  run! if app_file == $0

end
