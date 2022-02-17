require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peeps.rb'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end
  
  get '/feed' do
    @feed = Peeps.all
    erb :'feed'
  end

  post '/feed' do
    Peeps.create(peep: params[:peep])
    redirect '/feed'
  end

  run! if app_file == $0

end