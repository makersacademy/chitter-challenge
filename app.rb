require 'sinatra/base'
require './lib/cheep'

class Chitter < Sinatra::Base

  get '/' do
    'Cheeps'
  end

  get '/cheep_feed' do
    @cheeps = Cheep.all
    erb :cheep_feed
  end

  get '/create_cheep' do
    erb :"create_cheep"
  end

  post '/cheep_feed' do
    Cheep.create(message: params[:message], author: params[:author])
    redirect '/cheep_feed'
  end

  run! if app_file == $0
end