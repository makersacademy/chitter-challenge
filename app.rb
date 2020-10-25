require 'sinatra/base'
require_relative 'chitter'

class ChitterSite < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/chitters' do 
    Chitter.add(params[:peep])
    redirect('/chitters/all')
  end
  
  get '/chitters/all' do
    erb :chitters
  end

  run if app_file == $0
end