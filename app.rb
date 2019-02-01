require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  disable :show_exceptions

   get '/' do
     erb :home
   end

   get '/feed' do
     @peeps = Peep.all
     erb :feed
   end

end
