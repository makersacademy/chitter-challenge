require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/database_interface.rb'
require_relative './lib/peep.rb'

ENV['DATABASE'] = 'chitter'

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash
  include Database_interface

  get('/') do
  @peeps = view_peeps
  erb :index
  end

end
