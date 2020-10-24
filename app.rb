require 'sinatra/base'
require_relative 'chitter'

class ChitterSite < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/chitters' do 
    params[:message]
  end

  run if app_file == $0
end