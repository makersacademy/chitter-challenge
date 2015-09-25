require 'sinatra/base'
require_relative 'data_mapper_setup'

class App < Sinatra::Base
  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end
end
