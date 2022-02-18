require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peeps'

class Chitter < Sinatra::Base 
  configure :development do 
    register Sinatra::Reloader 
  end

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/peep' do
    Peep.create(message: params['message'])
    redirect '/'
  end

  run! if app_file == $0
end
