require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/view' do
    @peeps = Peep.all
    erb :'/view'
  end

  get '/post' do
    erb :'/post'
  end

  post '/view' do
    Peep.create(message: params[:message])
    redirect '/view'
  end



  run! if app_file == $0
end
