require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/partial'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    register Sinatra::Partial
  end

  get '/' do
    erb(:index)
  end

  post '/peep' do
    # this should be passed into my model = params[:peep]
  end

  run! if app_file == $0
end