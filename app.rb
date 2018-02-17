require 'sinatra/base'
require 'sinatra/flash'
require './lib/database_connection_setup'
require './lib/peep'

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect ('/peeps')
  end

  get '/peeps' do
    @peeps = Peep.all
    erb(:'peeps/index')
  end

  post '/peeps/new' do
    Peep.create(params[:text], params[:author])
    redirect '/peeps'
  end

end
