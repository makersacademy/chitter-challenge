require 'sinatra/base'
require 'sinatra/reloader'

class ChitterChallenge < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @status = params[:name]
    erb :index
  end

  post '/' do
    @status = params[:status]
    erb :index
  end


  run! if app_file == $0
end