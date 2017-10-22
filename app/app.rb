ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative './models/peep.rb'
require_relative './data_mapper_setup'

class Chitter < Sinatra::Base
  get '/' do
    redirect '/feed'
  end

  get '/feed' do
    @peeps = Peep.all
    erb :feed
  end
end
