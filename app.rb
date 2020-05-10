require 'sinatra'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/' do 
    'testing'
  end 

  get '/peeps' do 
    @peeps = Peep.all
    erb(:peeps)
  end

  post '/peeps' do 
    Peep.add(body: params['body'])
    redirect('/peeps')
  end
end