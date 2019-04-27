require 'sinatra/base'
require 'sinatra'
require 'data_mapper'
require './lib/peeps'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    redirect '/chitter'
  end

  get '/chitter' do
    erb(:'chitter/index')
  end

  post '/chitter/log' do
    p params
    Peep.create(peep: params[:peep], time: params[:time])
    redirect '/chitter/view'
  end

  get '/chitter/view' do
    @peeps = Peep.all.reverse
    erb(:'chitter/view')
  end

  run! if app_file == $0
end
