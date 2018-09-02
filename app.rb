require 'sinatra/base'

class ChitterChallenge < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/peeps' do
    erb(:peeps)
  end

end