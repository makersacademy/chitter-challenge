require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/chitter'

class ChitterManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
     'Chitter'
    # p ENV
  end

  get '/chitters' do
    @chitters = Chitter.all
    erb :'chitters/index'
  end

  get '/chitters/new' do
    erb :"chitters/new"
  end

  post '/chitters' do
    Chitter.create(text: params[:text], message: params[:message])
    redirect '/chitters'
  end

  run! if app_file == $0
end