require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'messages/index'
  end

  get '/peeps/new' do
    erb :'messages/new'
  end

  post '/peeps' do
    Peep.create(message: params[:message], time: DateTime.now)
    redirect to('/peeps')
  end


end