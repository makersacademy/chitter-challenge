require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/chitter'

class ChitterMessenger < Sinatra::Base

  enable :sessions, :method_override

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    redirect '/messages'
  end

  get '/messages' do
    @messages = Chitter.all.reverse
    erb :'messages/index'
  end

  get '/messages/new' do
    erb :'messages/new'
  end

  post '/messages' do
    Chitter.create(peep: params[:peep], posted_at: Time.now)
    redirect '/messages'
  end

  run! if app_file == $0
end
