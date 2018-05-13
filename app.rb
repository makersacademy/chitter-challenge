require 'sinatra/base'
require 'sinatra'
require './models/cheep'

class Chitter < Sinatra::Base

  get '/' do
    @cheeps = Cheep.all
    erb(:index)
  end

  get '/cheep/new' do
    erb(:create_cheep)
  end

  post '/cheep/new' do
    Cheep.create(params[:name], params[:handle], params[:message])
    redirect '/'
  end

end
