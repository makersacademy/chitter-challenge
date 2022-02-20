require 'sinatra/base'
require 'sinatra/reloader'
require './lib/chitter.rb'

class Chitter_challenge < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    #@username = Chitter.signup
    erb :index
  end

  post '/' do
    Chitter.signup(username: params[:username], name: params[:name], emailaddress: params[:emailaddress], password: params[:password])
    @username = params[:username]
    erb :signup
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
