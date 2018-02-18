require 'sinatra/base'
require './lib/cheeter'
require './database_connection_setup'

class Cheeter < Sinatra::Base

  get '/' do
    erb :sign_in
  end

  post '/add_peep' do
   @sig_in = Peep.sign_in(params[:name])
    erb :peep
  end

  post '/first_peep' do
    @peep = params[:peep]
    @peeps = Peep.all
    @add_post = Peep.add_peep(params[:peep])
    erb :add_post
  end

  get '/view_history' do
    @peeps = Peep.all
    @add_post = Peep.add_peep(params[:peep])
    erb :view_history
  end


end
