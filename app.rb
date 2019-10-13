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
  p ENV
  @cheeps = Cheep.all
  erb :'cheeps/index'
end

run! if app_file == $0
end
