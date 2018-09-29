require 'sinatra/base'
require 'data_mapper'
require './models/peep'

class Chitter < Sinatra::Base
  get '/' do
    redirect('/peeps')
  end

  get '/peeps' do
    set_up unless ENV['ENVIRONMENT']
    @peeps = Peep.all_sorted
    erb :index
  end

  post '/peeps' do
    Peep.add(params[:message]) unless params[:message].empty?
    redirect('/peeps')
  end

  get '/peeps/:id' do
    @peep = Peep.get(params[:id])
    erb :peep
  end

  def set_up
    DataMapper::setup(:default, "postgres://andres@localhost/chitter")
    DataMapper.finalize
  end

  run! if app_file == $0
end
