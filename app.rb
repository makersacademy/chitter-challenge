require './database_connection_setup'
require './lib/peep'
require 'sinatra/base'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps/add_peep' do
    Peep.add(params[:new_peep_text])
    redirect '/peeps'
  end

  run! if app_file == $0

end
