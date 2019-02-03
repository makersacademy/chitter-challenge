require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/' do
    'Welcome to Chitter'
  end
  
  get '/peep' do
    @peeps = Peeps.all
    erb :new_peep
  end
  
  post '/peep' do
    Peeps.create(params[:new_peep])
    redirect '/peep'
  end

  run! if app_file == $0
end
