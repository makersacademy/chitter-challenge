require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = [
       "First peep", 
      "Second peep", 
      "Third peep"
      ]
    erb :peeps
  end

  post '/peeps' do
    redirect '/peeps'
  end
  
  run! if app_file == $0
end