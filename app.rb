require 'data_mapper'
require 'sinatra/base'

require_relative 'models/peeps'

class Chitter < Sinatra::Base
  DataMapper.setup(:default, 'postgres://Emma@localhost/chitter')
  DataMapper.finalize
  DataMapper.auto_migrate! # NB wipes table each time

  get '/' do
    erb :index
  end

  post '/new' do
    Peep.create(content: params[:content])
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all(:order => [:created_at.desc, :id.desc])
    erb :all
  end

  run! if app_file == $0
end
