require 'sinatra/base'
require './lib/maker'
require './lib/peep'
require './database_connection_setup'

class Chitter < Sinatra::Base
  get '/' do
    "Hello world"
  end

  get '/peeps' do
    @peeps = Peep.all
    @current_user = Maker.current
    erb :peeps
  end

  post '/peeps' do
    Peep.add(params[:new_peep])
    redirect '/peeps'
  end

  post '/makers' do
    Maker.add(params[:name], params[:username],
      params[:email], params[:password])
    redirect '/peeps'
  end

  run! if app_file == $0
end
