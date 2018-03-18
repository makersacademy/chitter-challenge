require 'sinatra/base'
require './lib/peeps'
require_relative './spec/database_connection_setup'

class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peeps.all
    erb :index
  end

  post '/post-a-peep' do
    Peeps.post(params[:peep])
    redirect '/'
  end

  run! if app_file == $0
end
