require 'sinatra/base'
require 'sinatra/reloader'
require './lib/chitter'

class ChitterFeed < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Chitter'
  end

  get '/feed' do
    @peeps = Chitter.all
    erb :index
  end

  post '/feed' do
    Chitter.create(name: params[:name], message: params[:message], time: Time.new)
    redirect '/feed'
  end

  run! if app_file == $0
end
