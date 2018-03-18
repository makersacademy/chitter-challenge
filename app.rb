require "sinatra/base"
require "./lib/peep"
require "./lib/timeline"
require "./lib/user"

class Chitter < Sinatra::Base
  enable :sessions
  register sinatra::Flash
  set :method_override, true

  get '/' do

    erb :index
  end
end
