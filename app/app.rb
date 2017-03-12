ENV["RACK_ENV"] ||= 'development'

require 'sinatra/base'
require_relative 'models/user'
require_relative '../data_mapper_setup'

class Chitter < Sinatra::Base

  get '/' do
    #sign up, log in
    #You don't have to be logged in to see the peeps.
    "Welcome to chitter"
  end


end
