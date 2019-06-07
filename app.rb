require 'sinatra/base'
require './lib/peep'

class ChitterChatter < Sinatra::Base
  
  get '/' do
    @all_peeps = Peep.all
    erb :main
   end

   get '/new-peep' do
    erb :adding_peeps
   end

   post '/add' do
    Peep.create(params[:peep])
    redirect '/'
   end
  
  run! if app_file == $0
end