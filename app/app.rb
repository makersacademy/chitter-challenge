require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions

  get '/chits' do
    @chits = Chit.all
    erb :'chits/index'
  end

  run! if app_file == Chitter

end
