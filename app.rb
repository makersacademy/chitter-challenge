require 'sinatra/base'
require 'sinatra/flash'
require_relative 'lib/cheet'
require 'rubygems'
require 'data_mapper'
require_relative 'database_connection_setup'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  enable :sessions

  get '/' do
    redirect '/cheets'
  end

  get '/cheets' do
    @cheets = Cheet.reverse_chronological_cheets
    erb(:cheets)
  end

end
