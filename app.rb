require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peeps'

class Chitter < Sinatra::Base 
  configure :development do 
    register Sinatra::Reloader 
  end
  
  get '/' do
    @peeps = Peep.all.reverse
    erb :index
  end

  post '/add' do
    Peep.create(content: params[:peep])
    redirect '/'
  end

  run! if app_file == $0
end
