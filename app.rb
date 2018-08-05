require 'sinatra/base'
require './lib/peep'
require './data_mapper_setup'

class Chitter < Sinatra::Base
  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :index
  end

  run! if app_file == Chitter
end
