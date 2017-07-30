require 'sinatra/base'
require_relative 'models/peep'

class Chitter < Sinatra::Base
  enable :sessions

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end
end
