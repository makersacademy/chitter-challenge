
require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'
require './lib/chit'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  # get '/' do
  #   # erb :index
  #   redirect '/chits'
  # end

  get '/' do
    @chits = Chit.all
    erb :index
  end

  get '/post_chit' do
    erb :post_chit
  end

  post '/post_chit' do
    Chit.post(handle: params[:handle], content: params[:chit])
    redirect '/'
  end



  run! if app_file == $0
end
