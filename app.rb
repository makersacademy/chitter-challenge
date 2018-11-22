require 'sinatra/base'
# require './lib/chitter'

class ChitterApp < Sinatra::Base

  get '/chitter' do 
   'Hello world'
  end
end
