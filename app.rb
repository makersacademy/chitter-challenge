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
    Peep.add_message(message: params['message'])
    @peep = Peep.all
    erb :index
  end

  post '/chitter/create_new' do
    @message = params[:message]
    @peep = Peep.all
    redirect '/chitter'
  end
end
