ENV['RACK-ENV'] = 'development'

require 'sinatra/base'
require_relative 'dm_init'

class Chitter < Sinatra::Base
  
  get '/peeps/index' do
    erb :'peeps/index'
  end
  
  post '/peeps/new' do
    Peep.create(peep: params[:peep])
    redirect '/peeps/index'
  end
  
end
