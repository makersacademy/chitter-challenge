require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'

class Chitter < Sinatra::Base

  configure :development do
    register Sinatra::Reloader 
  end

  get '/' do
    @peep = Peep.all
    erb :homepage
  end

  post '/' do
    @newpeep= Peep.create(peep: params[:peep])
    erb :homepage
    redirect '/'
  end

run! if app_file == $0

end