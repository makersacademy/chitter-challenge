require 'sinatra/base'
require './lib/cheeter'
require './database_connection_setup'

class Cheeter < Sinatra::Base

  get '/' do
    erb :sign_in
  end

  get '/add_peep' do
    erb :peep
  end

  post '/first_peep' do
    @peeps = Peep.all
    @add_post = Peep.add_peep(params[:name], params[:text])
    erb :add_post
  end

end
