require 'sinatra/base'
require_relative './lib/peeps'
require_relative './lib/users'

class ChitterChallenge < Sinatra::Base 

  get '/registrations/new' do
    erb :'registrations/index'
  end

  get '/registrations/confirmation' do 
    "You are now signed up to Chitter!"
  end

  post '/registrations/confirmation' do 
    redirect '/registrations/confirmation'
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