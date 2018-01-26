require 'sinatra/base'

require_relative 'models/peep'

  class Chitter < Sinatra::Base

   get '/peeps' do
     @peeps = Peep.all
     erb :'peeps/index'
   end

   get '/links/new' do
     erb :'links/new'
   end

  end
