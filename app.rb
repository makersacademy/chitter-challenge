require 'sinatra/base'
require './lib/peep.rb'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/add_peep' do
    erb :add_peep
  end

  get '/view_peeps' do
    p @peeps = Peep.all
    erb :peeps
  end

  post '/peeps' do
    Peep.create(peep: params['peep'])
    redirect '/'
  end


  run! if app_file == $0
end
