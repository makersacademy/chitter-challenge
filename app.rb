require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    redirect '/chitter'
  end

  get '/chitter' do
    @peeps = Peep.all

    erb :'/chitter/index'
  end

  get '/chitter/new' do
    erb :'/chitter/new'
  end

  post '/chitter' do
    p '*********'
    p params
    Peep.create(peeps: params[:peeps])
    redirect '/chitter'
  end



  run! if app_file == $0
end
