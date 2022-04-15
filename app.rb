require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb(:index)
  end

  get '/peeps' do
    "Hey guys! I'm new"
  end

  get '/peeps/new' do
    erb(:'peeps/new')
  end

end