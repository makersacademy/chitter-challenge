require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/add-peep' do
    p params 
    Peep.add_peep(params[:peep], params[:maker])
    redirect '/'
  end
end


