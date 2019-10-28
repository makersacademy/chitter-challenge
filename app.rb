require 'sinatra/base'
require_relative 'lib/peep'

class ChitterChallenge < Sinatra::Base

  get '/' do
    erb :login
  end

  get '/home' do
    @peeps = Peep.all
    erb :homepage
  end

  get '/add_peep' do
    erb :add_peep
  end

  post '/post_peep' do
    Peep.add(content: params[:yourPeep])
    redirect '/home'
  end
end
