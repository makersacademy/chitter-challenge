ENV["RACK_ENV"] ||= "development"
require_relative './models/data_mapper_setup.rb'
require 'sinatra/base'

class Chitter < Sinatra::Base

  enable :sessions

  get '/home' do
    "Welcome to Chitter the home of insightful quips on quantum physics"
  end

end
