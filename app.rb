require 'sinatra/base'
require './lib/peep'
require 'net/http'
require './spec/database_connection_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect '/create_peep'
  end

  get '/create_peep' do
    @peep = Peep.all
    erb(:index)
  end

  post '/create_peep/new' do
    Peep.add(params[:message], params[:title])
    redirect '/'
  end

  run! if app_file == $0
end
