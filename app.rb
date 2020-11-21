require 'sinatra'
require_relative './lib/peep'
require_relative './database_connection_setup'
class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @peep = Peep.all
    erb :index
  end

  get '/peeping' do
    erb :peeping
  end

  post '/peeping' do
    Peep.peep(peep: params[:peep])
    redirect '/'
  end

  run if app_file == $0
end
