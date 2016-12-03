ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup.rb'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/sign_up' do
    erb :sign_up
  end

run! if app_file == $0
end
