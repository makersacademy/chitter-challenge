require 'sinatra/base'
require 'sinatra/reloader'
require './lib/chitter'

class Chitter < Sinatra::Base
  configure :development do 
    register Sinatra::Reloader 
  end

  get '/chitter' do
    erb(:index)
  end

  post '/new-chitter' do
    Chitter.add(params[:add_chitter_name], params[:add_chitter_chit])

    redirect to '/chitter'
  end 

  run! if app_file == $0
end
