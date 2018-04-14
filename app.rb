require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/database_interface.rb'
require_relative './lib/peep.rb'

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash
  include Database_interface

  get('/') do
  erb :index
  end

end
