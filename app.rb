
require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/' do
    erb :homepage
  end

  get '/feed' do
    @peeps = Peep.all
    erb :index
  end

  get '/feed/create' do
    erb :"feed/create"
  end

  post '/feed' do
  Peep.create(content: params[:content])
  redirect '/feed'
end

  run! if app_file == $0
end
