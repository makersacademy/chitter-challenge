require 'sinatra/base'
require_relative 'data_mapper_setup'
class Chitter < Sinatra::Base

  get '/' do
    redirect to('/peeps/new')
  end

  get '/peeps/' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
   erb :'peeps/new'
 end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
