require 'sinatra/base'
require './lib/peep'
require './spec/database_connection_setup'
# require 'sinatra/flash'

class Chitter < Sinatra::Base

  get '/' do
    redirect('/peeps')
  end

  get '/peeps' do
    @peeps = Peep.all
    erb(:'peeps/index')
  end
  #
  post '/peeps' do
    @peeps = Peep.all
    erb(:'peeps/index')
    # peep = Peep.create(message: params['message'])
  end

  # get '/peeps/new' do
  #   # peep = peeps.create
  #   erb(:'peeps/new')
  # end
  #
  # post '/feed' do
  #
  # end

end
