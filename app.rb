require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do 
    'Hello World'
  end

  get '/chitter' do
    @peep = Peep.post
    erb:'chitter'
  end

  post '/chitter' do
    Peep.new(peep: params[:peep])
    redirect '/chitter'
  end

  get '/chitter/new' do
    erb :'chitter/new'
  end

  run! if app_file == $0

end
