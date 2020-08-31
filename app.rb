require 'sinatra/base'
require './lib/chitter'

class Chitter < Sinatra::Base 

  get '/' do
    @cheeps = Cheep.all
    erb :index
  end

  get '/cheep/new' do 
    erb :"cheep/new"
  end

  post '/' do
    Cheep.create(cheep: params[:cheep])
    redirect '/'
  end


  run! if app_file == $0

end