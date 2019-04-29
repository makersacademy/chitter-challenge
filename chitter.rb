require 'sinatra/base'
require './lib/peep.rb'

class Chitter < Sinatra::Base

  enable :sessions

  get '/chitter' do
    @peep = Peep.all
    erb :'chitter/index'
  end

  get '/chitter/new' do
    erb :'chitter/new'
  end

  post '/chitter/new' do
    Peep.post(peep: params[:peep])
    redirect '/chitter'
  end

  run! if app_file == $0
end
