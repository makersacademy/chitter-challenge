require 'sinatra/base'
require 'sinatra'
require './lib/cheep'

class Chitter < Sinatra::Base

  enable :sessions

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

  run! if app_file == $0

end
