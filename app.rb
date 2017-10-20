require 'sinatra/base'

class ChitterChallenge < Sinatra::Base
  get '/' do
    erb(:index)
  end

  get '/composepeep' do
    erb(:newpeep)
  end

  get '/peeps' do
    @peeps = peep.all
    erb(:index)
  end
end
