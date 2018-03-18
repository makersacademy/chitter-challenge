require "sinatra/base"
require "./lib/peep"
require "./lib/timeline"
require "./lib/user"
require "./lib/database"
require "rack"
require "sinatra/flash"

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  set :method_override, true

  get '/' do
    @peeps = Timeline.all
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  run! if app_file == $PROGRAM_NAME

end
