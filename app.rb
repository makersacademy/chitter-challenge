require 'sinatra/base'
require_relative './lib/peep_manager.rb'

class Chitter < Sinatra::Base

  get '/' do
    'Testing infrastructure'
  end

  get '/peep_feed' do
    @peeps = Peeps.all
    erb :peep_feed
  end

  get '/post_peep' do
    erb :post_peep
  end

  post '/post_peep' do
    @peep = params[:peep_field]
    Peeps.create(@peep)
    redirect('peep_feed')
  end

  run! if app_file == $0
end
