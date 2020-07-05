require 'sinatra/base'
require 'pg'
require './lib/chitter.rb'

class ChitterPost < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/post' do
    erb :post
  end

  post '/add_post' do
    Chitter.create(message: params[:peep_txt])
    redirect to('/live')
  end

  get '/live' do
    @chitter = Chitter.all
    erb :live
  end

  run! if app_file == $0
end