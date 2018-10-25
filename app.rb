require 'sinatra/base'
require './lib/cheet'

class Chitter < Sinatra::Base

  get '/' do
    @cheets = Cheet.all
    erb :index
  end

  post '/new-cheet' do
    Cheet.create(params[:cheet])
    redirect '/'
  end


end
