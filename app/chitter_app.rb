require 'sinatra/base'
# require 'sinatra/flash'
require './lib/peep'

class ChitterApp < Sinatra::Base
  enable :sessions
  set :session_secret, "whatevs"
  # register Sinatra::Flash

  get '/' do
    @peeps = Peep.all.reverse
    erb(:index)
  end

  post '/post' do
    Peep.create(message: params[:new_peep])
    redirect '/'
  end
  
  run! if app_file == $PROGRAM_NAME
end
