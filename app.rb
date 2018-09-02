require 'sinatra/base'
require 'sinatra/flash'
require 'pg'
require './lib/peep'
require './setup_database_connection'


class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  get '/compose' do
    erb :compose
  end
  
  post '/peep' do
    @content = params[:peep]
    @author_id = '1'
    Peep.create_peep(@content, @author_id)
    redirect '/'
  end

  run! if app_file == $0
  
end
