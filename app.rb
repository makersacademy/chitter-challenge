require 'sinatra/base'
require 'sinatra/reloader'
require './model/chitter_logic'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb(:index)
  end
  
  post '/feed' do
    Logic.create(peep: params[:peep])
    erb(:feed)
  end

  run! if app_file == $0

end