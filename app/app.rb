require 'sinatra/base'
require_relative 'models/peep'

class Chitter_Challenge < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(peeps: params[:peep], time: Time.now)
    redirect to('/peeps')
  end
end
