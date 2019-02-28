require 'sinatra/base'
require './lib/peep.rb'

class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/add-peep' do
    erb :add_peep
  end

  post '/new-peep' do
    Peep.add(params[:new_chitter_user], params[:new_chitter_message])
    redirect('/')
  end
end
