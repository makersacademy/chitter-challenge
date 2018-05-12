require 'sinatra'
require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'
require 'pg'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get('/') do
    @peeps = Peep.all
    erb(:index)
  end

end
