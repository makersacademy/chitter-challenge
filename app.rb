require 'sinatra'
require './lib/peep'
require './db_connection_setup'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/peeps' do
    Peep.new_peep(params[:content])
    redirect "/"
  end

end
