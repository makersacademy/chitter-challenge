require 'sinatra/base'
require_relative './database_connection_setup'
require_relative './lib/peep'

class Chitter < Sinatra::Base

  get '/chitter' do
    @peeps = Peep.reverse_order
    erb :index
  end

  get '/chitter/new' do
    erb :new
  end

  post '/chitter' do
    Peep.create(content: params[:peep_content])
    redirect '/chitter'
  end

  run! if app_file == $0

end
