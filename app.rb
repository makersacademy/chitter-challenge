require 'sinatra/base'
require './lib/peep'
require './spec/database_connection_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :index
  end

  post '/peep/new' do
    Peep.add(params[:new_peep])
    redirect '/'
  end

  run! if app_file == $0
end
