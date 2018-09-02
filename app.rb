require 'sinatra/base'
require './lib/peep.rb'

class Chitter < Sinatra::Base

  get '/' do

  end

  get '/feed' do
    erb :feed
  end

  get '/feed/send_peep' do
    peep = params[:peep_content]
    Peep.create(peep)
    redirect '/feed'
  end

end
