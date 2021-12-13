require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do 
    redirect '/home'
  end 

  get '/home' do
    @peeps = Peep.all
    erb :'home/index'
  end 

  post '/home' do
    @timestamp = Time.now.strftime("%H:%M")
    Peep.create(peep_body: params[:peep_body], created_at: @timestamp)
    redirect '/home'
  end 

run if app_file == $0 
end