require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep.rb'

class Chitter < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    redirect '/home'
  end

  get '/home' do
    @feed = Peep.all
    erb :index
  end

  get '/home/add' do
    erb :add
  end

  post '/home' do
    p params
    Peep.create(params[:new_peep])
    redirect '/home'
  end
  



  run! if app_file == $0
end