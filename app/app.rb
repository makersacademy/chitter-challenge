ENV["RACK_ENV"] = "development"

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require_relative 'data_mapper_setup'
require_relative 'server'
require_relative 'controllers/peeps'
require_relative 'controllers/sessions'
require_relative 'controllers/users'

class Chitter < Sinatra::Base

  get '/peeps' do
    erb :'/peeps'
  end

end
