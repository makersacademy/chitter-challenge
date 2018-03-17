require 'pg'
require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/peep'
#require_relative 'lib/user'
#require './database_connection_setup'

class Chitter < Sinatra::Base

  register Sinatra::Flash

  enable :sessions

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  get '/' do
    erb :index
  end


  # post 'post-peep' do
  #   Peep.post_peep(params['url'])
  #
  # end
  # get '/' do
  #   @peeps = "hi, what's up?"
  #
  #   erb :index
  # end

run! if app_file == $0

end
