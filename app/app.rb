require 'sinatra/base'
require_relative 'models/peep'


class Chitter < Sinatra::Base

  get '/peeps' do
    # This uses DataMapper's .all method to fetch all
    # data pertaining to this class from the database
    @peeps = Peep.all
    erb :'peeps/index'
  end
  
end
