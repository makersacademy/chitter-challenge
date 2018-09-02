require 'sinatra/base'

class ChitterChallenge < Sinatra::Base

  get '/' do
    erb(:index)
  end
end