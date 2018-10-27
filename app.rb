require 'sinatra/base'
require './lib/peep'

class ChitterManager < Sinatra::Base
  get '/' do
    'Chitter Manager'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  run! if app_file == $0
end
