require 'sinatra/base'
require_relative 'models/peep'

class Chitter < Sinatra::Base

  use Rack::MethodOverride
  
  get '/peeps' do
    @peeps = Peeps.all
    erb :'peeps/home'
  end
end
