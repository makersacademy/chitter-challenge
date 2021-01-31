require 'sinatra/base'
require_relative './lib/peeps'

class ChitterChallenge < Sinatra::Base 

  get '/' do
    "Welcome to Chitter"
  end

  get '/peeps' do 
    erb :peep_create
  end
  
  post '/display' do 
    Peeps.create(params['peep'])
    redirect '/display'
  end

  get '/display' do
    @peeps = Peeps.all
    erb :'peep_display'
  end

  run! if app_file == $0
end