require 'sinatra/base'
require './lib/peep.rb'

class Chitter < Sinatra::Base
  get '/test' do
    'Testing infrastructure'
  end

  get '/' do
    "Chitter"
  end

  get '/view-peeps' do
    @peeps = Peeps.all
    erb :"view-peeps"
  end

  get '/new-peep' do
    erb :"new-peep"
  end

  post '/view-peeps' do
    # p params
    # puts "Form data submitted to the /view-peeps route"
    peep = params['peep']
    
  
  end

  run! if app_file == $0
end
