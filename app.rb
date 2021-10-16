require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'
require './lib/chitter'

class ChitterController < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/flow' do
    @chitt = $chitt
    erb :"flow/index"
  end

  post '/flow' do
    p "SEE BELOW"
    p $chitt = params["chitt"]
    redirect '/flow'
  end

  get '/flow/new' do
    erb :"flow/new"
  end

  run! if app_file == $PROGRAM_NAME

end