require 'sinatra/base'
require './database_connection_setup'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/' do 
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  post '/peeps/new' do
    Peep.add(content: params[:New_peep])
    redirect '/peeps'
  end

end
