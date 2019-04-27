require 'sinatra/base'
require 'sinatra'
require 'data_mapper'

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
    @peep = Peep.all.reverse
    erb(:'chitter/view')
  end

  run! if app_file == $0
end
