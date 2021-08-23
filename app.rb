require 'sinatra/base'
require 'sinatra/reloader'
require "./lib/chitter"

class ChitterApp < Sinatra::Base 
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @peeps = Chitter.feed
    erb :index
  end

  get '/new_peep' do
    erb :new_peep
  end
  
  post '/new_peep' do
    Chitter.create(peep: params[:peep])
    redirect '/'
  end

  run! if app_file == $0
end