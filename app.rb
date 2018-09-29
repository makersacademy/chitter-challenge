require 'sinatra/base'
require 'data_mapper'
require './models/peep'

class Chitter < Sinatra::Base
  get '/' do
    DataMapper::setup(:default, "postgres://andres@localhost/chitter")
    DataMapper.finalize
    redirect('/peeps')
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :index
  end

  post '/peeps' do
    Peep.add(params[:message])
    redirect('/peeps')
  end

  get '/peeps/new' do
    erb :create_peep
  end

  run! if app_file == $0
end
