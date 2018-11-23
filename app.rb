require 'sinatra/base'
require './lib/peep'

class ChitterApp < Sinatra::Base

  get '/chitter' do
    @message = params[:message]
    @peep = Peep.all
    erb :index
  end

  post '/chitter' do
    @message = params[:message]
    @peep = Peep.all
    erb :index
  end
end
