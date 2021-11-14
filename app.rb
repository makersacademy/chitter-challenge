require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  
  get '/' do
    @peeps = Peep.all
    erb :peep_feed
  end

  post '/new_peep' do
    Peep.create(new_content: params[:peep_content])
    redirect '/'
  end

  run! if app_file == $0
end
