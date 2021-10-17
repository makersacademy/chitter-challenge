require 'pg' # remove this later
require 'sinatra/base'
require 'sinatra/reloader'
#require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/new' do
    erb :new
  end
end
