require 'sinatra/base'
require './lib/peep'
require './spec/database_connection_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb(:index)
  end

  post '/new_peep' do
    @add_peep = Peep.add(params[:peep], session[:id])
    redirect '/'
  end

  run! if app_file == $0
end
