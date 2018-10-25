require 'sinatra/base'
require './lib/chitter'

class App < Sinatra::Base

  get '/chitter' do
    @peeps = Chitter.all
    erb(:index)
  end

  post '/peep_post' do
    Chitter.create_peep(params[:peep])
    redirect to('/chitter/peeps')
  end

  get '/chitter/peeps' do
    @peeps = Chitter.all
    erb(:all_peeps)
  end 


  run! if app_file == $0
end
