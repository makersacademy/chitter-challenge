require 'sinatra/base'
require_relative 'lib/peep'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all

    erb :index
  end

  post '/' do
    @peeps = Peep.all
    @peeps.unshift("#{params['peep-date']}; #{params['peep-time']}; #{params['message']}")
    erb :index
  end

  get 'post_peep' do
    erb :post_peep
  end

  run! if app_file == $0
end
