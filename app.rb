require 'sinatra/base'
require './lib/chitter'
require 'pg'

class Chitter_Challenge < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    "Chitter Peeps:"
  end

  get '/peeps' do
    @peeps = Chitter.all
    erb :'peeps/index'
  end

end
