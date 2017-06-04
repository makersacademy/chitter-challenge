require 'sinatra/base'
require_relative 'models/peep'

class Chitter < Sinatra::base

  get '/peeps' do
    'Make sure infrastructure works'
  end

end
