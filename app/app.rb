ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'models/user'

class Chitter < Sinatra::Base

  get '/chitter' do
    erb :chitter
  end

  run! if app_file == $0

end
