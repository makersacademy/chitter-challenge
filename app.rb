require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

#  disable :show_exceptions

   get '/' do
     erb :home
   end

   get '/feed' do
     @peeps = Peep.all
     erb :feed
   end

   get '/feed/new_peep' do
     erb :new_peep
   end

   post '/feed' do
     Peep.add(params[:new_peep])
     redirect '/feed'
   end

end
