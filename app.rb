require 'sinatra/base'
require 'pg'
require './lib/peep.rb'
require './lib/database_connection_setup.rb'

class Chitter < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    erb :index
  end

  get '/compose' do
    erb :compose
  end

  post '/add_peep' do
    Peep.add(content: params[:peep_text])
    redirect '/peeps'
  end

  get '/peeps' do
    @all_peeps = Peep.all
    erb :peeps
  end

  run if app_file == $PROGRAM_NAME
end
