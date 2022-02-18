require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/chitter.rb'

class ChitterApp < Sinatra::Base
  configure :development do 
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/peeps' do
    erb :peeps
  end

  post '/post_peep' do
    $peep = Chitter.post(params[:peep])
    redirect '/peeps'
  end

  run! if app_file == $0
end