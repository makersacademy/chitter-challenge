require 'sinatra/base'
require_relative 'lib/peep'

# controller
class Chitter < Sinatra::Base
  get '/' do
    @peepdeck = Peep.all
    erb :index
  end

  get '/message/new' do
    erb :compose
  end

  run! if app_file == $0
end
