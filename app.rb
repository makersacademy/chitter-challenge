require 'sinatra/base'
# require './lib/peep'

class ChitterChatter < Sinatra::Base
  
  get '/' do
    erb :main
   end

   get '/new-peep' do
    erb :adding_peeps
   end
  
  run! if app_file == $0
end