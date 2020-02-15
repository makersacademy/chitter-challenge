require 'sinatra/base'
require './lib/peep.rb'

class PeepManager < Sinatra::Base
  get '/' do
    erb :homepage
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :"/peeps/index"
  end

  post '/peeps' do
    Peep.create(content: params["content"])
    redirect('/peeps')
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end
end
