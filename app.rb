require 'sinatra/base'
require './lib/peep'

class ChitterApp < Sinatra::Base

  get '/chitter' do
    @peep = Peep.all
    @message = params[:message]
    erb :index
  end

  post '/chitter' do
    @message = params[:message]
    erb :index
  end
end
