require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/chitter'

class ChitterChallenge < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/view' do
    @peeps = Chitter.all
    erb :view
  end

  get '/new' do
    erb :new
  end

  post '/view' do
    Chitter.create(message: params[:message])
    redirect '/view'
  end

  run! if app_file == $0
end
