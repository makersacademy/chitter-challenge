require 'sinatra/base'
require './lib/peep'

class  Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  get '/create_peep' do
    erb :create_peep
  end

  post '/new_peep' do
    Peep.create(params[:peep])
    redirect '/'
  end

  run if app_file == $0

end
