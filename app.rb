require 'sinatra'
require "sinatra/reloader" if development?
require 'sinatra/flash'
require 'uri'
require './lib/peep'



class Chitter < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    "CHITTER.COM"
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end
  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
   
  end

  # Start the server if this file is executed directly 
  # (do not change the line below)
  run! if app_file == $0
end