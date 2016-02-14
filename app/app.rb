
require 'sinatra/base'
require_relative 'models/chitter'

class Chitter < Sinatra::Base
  get '/chits' do
    @chits = Chit.all
    erb :'chits/index'
  end
end