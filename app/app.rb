require 'pg'
require 'sinatra'
require 'sinatra/contrib'
require_relative '../database_connection_setup.rb'
require_relative '../lib/peep.rb'

class ChitterApp < Sinatra::Base

  get '/' do
    @chitters = Peep.all
    erb(:index)
  end

  post '/message' do
    Peep.create(params[:message])
    redirect '/'
  end

end