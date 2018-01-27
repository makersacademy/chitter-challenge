ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/tweets' do
    erb :tweets
  end
end
