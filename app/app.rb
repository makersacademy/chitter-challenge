ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
# require 'sinatra'
require_relative './models/peep.rb'



class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    erb :'links/index'
  end
  

end
