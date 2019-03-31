require 'sinatra/base'
require_relative './database_connection_setup'

class Chitter < Sinatra::Base

  enable :sessions

  get '/chitter' do
    @peeps = Peep.all
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
