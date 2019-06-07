require 'sinatra/base'
require './lib/username'

class ChitterManager < Sinatra::Base
  get '/' do
    'Chitter - chit chat to your heart\'s content!'
  end

  # get '/chitter' do
  #   @chitter =
  # end
end
