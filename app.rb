require 'sinatra/base'
require 'pg'
require './lib/Entry'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/add' do
    erb :add
  end

  post '/add_peep' do
    Entry.add(params[:add])
    redirect '/'
  end

  run! if app_file == $0
end