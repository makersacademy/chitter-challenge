require 'sinatra/base'
require './lib/cheep'
require './database_connection_setup'
require 'uri'

class Chitter < Sinatra::Base
enable :sessions, :method_override

get '/' do
  'Welcome to Chitter'
  erb :'homepage'
end

post '/cheeps' do
  @cheeps = Cheep.all.reverse!
  erb :'cheeps/index'
end

post '/add' do
  cheep = Cheep.create(text: params[:text])
  redirect '/cheeps'
end

delete '/cheeps/:id' do
    Cheep.delete(id: params[:id])
    redirect '/cheeps'
  end

post '/signup' do
  erb :'signup'
end

run! if app_file == $0
end
