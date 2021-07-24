require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'
require './lib/peep'

class ChitterChallenge < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello, World!'
  end
  
  get '/peeps' do
    @peeps = Peep.all
    erb(:"peeps/index")
  end
  
  get '/peeps/new' do
    erb(:"peeps/new")
  end
  
  post '/peeps' do
    Peep.create(text: params[:peep])
    redirect '/peeps'
  end
  
  run! if app_file == $0
end
