ENV["RACK_ENV"] ||= "development"

require_relative 'data_mapper_setup'
require_relative 'models/user/new.rb'
require 'sinatra/base'

class Chitter < Sinatra::Base

  get "/" do
    "Hello World!"
  end

  run! if app_file == $0

end
