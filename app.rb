require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/add-peep' do
    erb :add_peep
  end

  post '/new-peep' do
    Peep.new(message: params[:message])
    redirect '/my-peeps'
  end

  get '/my-peeps' do
    erb :my_peeps
  end
  
  run! if app_file == $0
end
