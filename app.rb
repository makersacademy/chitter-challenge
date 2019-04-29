require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  set :session_secret, 'super secret'
    enable :sessions
  get '/' do
    @peeps = Peep.all
    erb :index
  end

  get '/compose_peep' do
    erb :compose_peep
  end

  post '/' do
    Peep.compose(peep_content: params[:peep_content])
    redirect '/'

  end


  run! if app_file == $0

end
