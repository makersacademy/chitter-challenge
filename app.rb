require 'sinatra/base'
require './lib/peep'
require './database_connection_setup'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/peeps/new' do
    Peep.create(params[:peep])
    redirect('/peeps')
  end

  get '/peeps' do
    @peeps = Peep.view.reverse
    erb :peeps
  end
end
