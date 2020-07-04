require 'sinatra/base'
require 'pg'
require './lib/chitter'



class ChitterApp < Sinatra::Base

  enable :sessions

  get '/' do
    p ENV
    erb: index
  end

  post '/list' do
    @list = Chitter.all
    p @list
    erb: list
  end

end