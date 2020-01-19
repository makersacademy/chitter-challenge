require 'sinatra/base'
require_relative './lib/peep'
require './database_connection_setup'

class Chitter < Sinatra::Base 

  get '/home' do 
    erb :index
  end 

  post '/home' do 
    @peep = Peep.add(params[:peep])
    redirect('/home')
  end 

  get '/all_peeps' do
    @peeps = Peep.all 
    erb :all_peeps
  end 

  post '/all_peeps' do 
    redirect('/all_peeps')
  end 

  run! if app_file == $0 
end 