require 'sinatra/base'
require_relative './lib/peep'

class Chitter < Sinatra::Base
  
  get '/' do
    'CHITTER'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb(:'peeps/index')
  end

  get '/peeps/new' do
    erb(:'peeps/new')
  end

  post '/peeps' do
    @message = Peep.create(params[:peep])
    redirect('/peeps')
  end

  run! if app_file == $0
end