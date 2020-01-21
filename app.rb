require 'sinatra/base'
require './lib/chitter'

class Chitters < Sinatra::Base

  get '/' do
    @chitter = Chitter.all
    erb :index
  end

  post '/message' do
    Chitter.create(message: params[:message], time: params[:time])
    redirect '/'
  end
end
