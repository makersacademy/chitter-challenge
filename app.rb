require 'sinatra'
require 'data_mapper'
require 'dm-postgres-adapter'
require './lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    DataMapper.setup(:default, 'postgres://localhost/chitter')
    DataMapper.finalize
    DataMapper.auto_upgrade!
  end

  enable :sessions

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  post '/peeps' do
    Peep.create(content: params[:peep])
    redirect '/peeps'
  end
end
