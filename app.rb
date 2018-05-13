require 'sinatra'
require 'sinatra/base'
require './lib/peep'

class PeepManager < Sinatra::Base

configure do
  enable :sessions
end

  get '/' do
    redirect '/peep'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end
  
  run! if app_file == $0
end
