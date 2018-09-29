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
    Peep.add(params[:message])
    redirect('/peeps')
  end

  get '/peeps/new' do
    erb :create_peep
  end

  def set_up
    DataMapper::setup(:default, "postgres://andres@localhost/chitter")
    DataMapper.finalize
  end

  run! if app_file == $0
end
