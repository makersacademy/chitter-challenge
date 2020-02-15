require 'sinatra/base'
require './lib/peeps.rb'

class Chitter < Sinatra::Base
  
  get '/' do
    "Welcome to Chitter!"
  end

  get '/peeps/index' do
    @chitter_feed = Peeps.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  # post '/peeps/index' do
  #   Peeps.create(params['peep'])
  #   redirect '/peeps/index'
  # end

  run! if app_file == $0
end