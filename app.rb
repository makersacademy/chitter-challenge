require 'sinatra'
require './lib/peep'

class ChitterApp < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  post '/post' do
    Peep.post(params[:name], params[:username], params[:post])
    redirect '/peeps'
  end

  run! if app_file == $0
end
