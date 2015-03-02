require 'hobbit'
require 'hobbit/contrib'
require 'data_mapper'

require_relative 'custom-hobbit'
require_relative 'data_mapper_setup'

class Server < Hobbit::Base
  include Hobbit::Mote
  include Hobbit::Session


  get '/' do
    render 'index', peeps: Peep.all
  end

  get '/users/new' do
    render 'usercreation'
  end

  post '/users' do

  end


end
