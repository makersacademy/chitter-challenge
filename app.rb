require 'sinatra/base'
require 'database_connection_setup'

class Chitter < Sinatra::Base

  get '/' do
    erb(:index)
  end

  post '/add_peep' do
    @peep = params[:new_peep]
    @name = params[:name]
    erb(:index)
  end

  run! if app_file == $0
end
