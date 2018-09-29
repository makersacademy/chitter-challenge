require 'sinatra/base'
require './app/models/peep'

class Chitter < Sinatra::Base
  get '/' do
    'welcome to Chitter'
  end

  get '/peeps/new' do
    erb :'peep/new'
  end

  post '/peeps' do
    # p 'form submitted'
    peep = params['peep_text']
    Peep.create(peep)
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb(:peeps)
  end
  run! if app_file == $0
end 