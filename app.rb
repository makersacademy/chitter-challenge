require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions

  get('/') do
    @peeps = Peep.all
    erb(:'peeps/index')
  end

  post('/new') do
    Peep.create(peep: params[:peep])
    redirect('/')
  end

  run! if app_file == $0
end
