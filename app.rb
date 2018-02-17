require 'sinatra/base'
require 'sinatra/flash'
require './lib/database_connection_setup'

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect ('/peeps')
  end

  get '/peeps' do
    erb(:index)
  end

end
