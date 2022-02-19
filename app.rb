require 'sinatra/base'
require 'sinatra/reloader'
require './lib/chitter.rb'

class Chitter_challenge < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    erb :index
  end

  post '/' do
    session[:peep] = params[:peep]
    redirect '/timeline'
  end

  get '/timeline' do
    @peep = Chitter.timeline
    erb :timeline
  end
  
  post '/timeline' do
    Chitter.post(peep: params[:peep])
    redirect '/timeline'
  end


  
  

  run! if app_file == $0
end
