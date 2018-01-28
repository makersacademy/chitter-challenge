ENV['RACK_ENV'] ||= 'development'

require_relative 'data_mapper_setup'
require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/peeps' do
    @peeps = Peep.all
    erb :'/peeps/index'
  end
end
