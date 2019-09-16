require 'sinatra/base'
require './lib/honk.rb'
require './lib/database_connection_setup.rb'

class Honker < Sinatra::Base

  get '/' do
    'Test infrastructure working.'
  end

  get '/honks' do
    @honks = Honk.all.reverse
    erb :'honks/index'
  end

  post '/honks' do
    Honk.add(text: params[:honk_text])
    redirect 'honks'
  end
end
