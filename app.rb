require 'sinatra/base'
require_relative 'lib/chitter'

class ChitterChallenge < Sinatra::Base


  get '/' do
    erb :login
  end

  get '/home' do
    @peeps = Chitter.all

    erb :homepage
  end
end
