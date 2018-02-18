require 'sinatra/base'
require './lib/peep'
require './spec/database_connection_setup'
# require 'sinatra/flash'

class Chitter < Sinatra::Base

  get '/' do
    redirect('/peeps')
  end

  get '/peeps' do
    @peeps = Peep.all.reverse
    erb(:'peeps/index')
  end

  post '/peeps' do
    Peep.add(params['peep'])
    @peeps = Peep.all.reverse
    erb(:'peeps/index')
  end

  get '/sign_up' do
    erb(:'users/index')
  end

  post '/sign_up' do
    
  end

end
