require 'sinatra/base'
require './data_mapper_setup'

class Chitter < Sinatra::Base

  get '/peeps' do
    erb :'peeps/index'
  end

  run! if app_file == $0
end