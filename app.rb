require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/' do 
    erb :index
  end

  get '/create_peep' do
    erb :new_peep
  end

  post '/submit_peep' do
    p Time.now
    Peep.create(peep: params['peep'], time_stamp: @time)
    redirect '/view_peeps'
  end

  get '/view_peeps' do
    @peeps = Peep.all
    erb :view_peeps
  end
end