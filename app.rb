require 'sinatra/base'
require './lib/chitter'

class ChitterManager < Sinatra::Base

  get '/' do
    @all_peeps = Chitter.all_peeps
    erb(:index)
  end

  run! if app_file == $0
end
