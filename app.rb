require 'sinatra/base'
require './lib/cheep'
require './database_connection_setup'
require 'uri'

class Chitter < Sinatra::Base
enable :sessions, :method_override

get '/' do
  'Welcome to Chitter'
end

get '/cheeps' do
  @cheeps = Cheep.all
  erb :'cheeps/index'
end

post '/add' do
  cheep = Cheep.create(text: params[:text])
  p params
  redirect '/cheeps'
end

run! if app_file == $0
end
