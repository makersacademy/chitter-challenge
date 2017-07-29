require 'sinatra/base'
require_relative 'data_mapper_setup'
class Chitter < Sinatra::Base

  get '/' do
    'Hello world!'
  end

  get '/peeps/new' do
    erb :new
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :timeline
  end

  post '/peeps' do
    peep = Peep.new(message: params[:content])
    peep.save
    redirect to('/peeps')
  end
end
