require 'sinatra/base'
require 'pg'


class Chitter < Sinatra::Base

  get '/' do
    @peeps = [
              "This is a test peep",
              "This is another test peep",
             ]

    erb :index
  end

end
