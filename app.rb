require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/' do
    'Chitter'
  end

  get '/peeps' do
    # @peeps = [
    #   "hello message 1",
    #   "Here is message 2",
    #   "This is message 3"
    # ]
    @peeps = Peep.all
    erb :'peeps/index'
  end

  run! if app_file == $0
end
