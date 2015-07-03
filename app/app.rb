require 'sinatra/base'
require 'data_mapper'
require './app/data_mapper_setup'

class App < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    peep = Peep.create(message: params[:message], time: Time.new)
    redirect to('/peeps')
  end

end
