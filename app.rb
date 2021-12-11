require 'sinatra/base'
require 'sinatra/reloader'
require './lib/chitter'
require './lib/peep'

class ChitterApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    redirect '/homepage'
  end

  get '/homepage' do
     @all_peeps = Peep.all
     p @all_peeps
    erb :homepage
  end

  get '/peep' do
    erb :create_peep
  end

  post '/peep' do
    Peep.create(content: params[:peep_content])
    p params
    redirect '/homepage'
  end


  run! if app_file == $0
end