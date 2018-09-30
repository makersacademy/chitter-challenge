require 'sinatra/base'
require './app/models/peep'
require './database_connection_setup'

class Chitter < Sinatra::Base
  get '/' do
    'welcome to Chitter'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    # p 'form submitted'
    Peep.create(peep: params['peep_text'], time: DateTime.now.to_s )
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb(:peeps)
  end
  run! if app_file == $0
end 