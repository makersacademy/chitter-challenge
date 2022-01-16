require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/partial'
require './lib/peep'


class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    register Sinatra::Partial
  end

  enable :sessions

  get '/' do
    erb(:index)
  end
    
  post '/peep' do
    redirect('/')
  end

  run! if app_file == $0
end