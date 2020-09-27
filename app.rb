require 'sinatra/base'
require './lib/peep_service'
require './database_connection_setup'


class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    @peeps = PeepService.all

    erb :index
  end

  post '/peeps' do
    # TODO: pass in author_id
    PeepService.post(params[:peep_message], '1')

    redirect '/'
  end
  run! if app_file == $0
end