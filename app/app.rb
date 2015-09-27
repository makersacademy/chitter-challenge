require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new_peep'
  end

  post '/peeps' do
    Peep.create(peep: params[:peep])
    redirect to('/peeps')
  end

# start the server if ruby file executed directly
run! if app_file == Chitter
end
