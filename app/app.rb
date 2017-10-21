require 'sinatra/base'
require './app/models/peep'

class Chitter < Sinatra::Base
  get '/peeps' do
  @peeps = Peep.all
  erb :'peeps/index'
  end
end
