require 'sinatra/base'
require './lib/peeps'
require 'pg'

class Chitter_Challenge < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    "Welcome to Chitter!!"
  end

  get '/peeps' do
    @peeps = Peeps.all
    erb :'peeps/index'
  end

end
