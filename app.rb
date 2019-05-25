require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/peeps' do
    @peeps = Peep.all
    erb(:'peeps/index')
  end

  get '/peeps/new' do
    erb(:'peeps/new')
  end

  post '/peeps/new' do
    Peep.send(message: params[:message])

    redirect('/peeps')
  end

  run! if app_file == $0
end
