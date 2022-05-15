require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Welcome to Chitter'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end 

  post '/peeps' do
    Peep.new(content: params[:content])
    redirect '/peeps'
  end 


  run! if app_file == $0
end