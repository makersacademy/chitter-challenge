require 'sinatra/base'
require './lib/peep'
require 'pg'

class Chitter < Sinatra::Base
  enable :sessions

  get '/chitter' do
    @peeps = Peep.all
    erb :'chitter/index'
  end

  get '/chitter/peep/new' do
    erb :'chitter/peep/new'
  end

  post '/chitter' do
    Peep.create(params[:peep])
    redirect to '/chitter'
  end

end
