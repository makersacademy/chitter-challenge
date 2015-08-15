require 'sinatra/base'
require_relative '../data_mapper_setup'

class Chitter_Challenge < Sinatra::Base

  get '/' do
    'Hello, welcome to chitter'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new_peeps'
  end

  post '/peeps' do

  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
