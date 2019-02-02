require 'sinatra'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    redirect '/chitter'
  end

  get '/chitter' do
    @peeps = Peep.all
    erb :'/peeps/index'
  end

  post '/chitter/create' do
    Peep.create(name: params[:name], message: params[:message])
    redirect '/chitter'
  end
end
