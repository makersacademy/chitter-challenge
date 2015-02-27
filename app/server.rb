require 'hobbit'
require 'hobbit/contrib'
require_relative 'custom-hobbit'

class Server < Hobbit::Base
  include Hobbit::Mote
  include Hobbit::Session

  get '/' do
    render 'index'
  end


end