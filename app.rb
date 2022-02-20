require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'

class Chitter < Sinatra::Base
  configure :development do 
    register Sinatra::Reloader 
  end

  get '/' do 
    'Chitter'
    erb :index
  end 

  get '/peep/new' do 
    erb :peeps 
  end 

  post '/peep' do 
    Peep.create(message: params[:message])
    erb :peeps
  end 

  # get '/peep' do 
  #   @peeps = Peeps.all
  #   erb :peeps
  # end 

  run! if app_file == $0 
end
