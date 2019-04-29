require 'sinatra/base'
require './lib/chitter'

class ChitterApp < Sinatra::Base

  get '/' do
'Hello World!!!!'
  end

get '/chitter' do
  @chitter = Chitter.all
erb :index
end

get '/chitter/new' do
  erb :new
end

post '/chitter/new' do
  Chitter.create(peep: params[:peep])
  redirect '/chitter'
end


  run! if app_file == $0
end
