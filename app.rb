require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    redirect '/chitter'
  end

  get '/chitter' do
    erb :"chitter/welcome"
  end

  get '/chitter/messaging' do
    erb :"chitter/messaging"
  end

  post '/messaging' do
    Peeps.create(params[:message])
    redirect '/chitter/feed'
  end

  get '/chitter/feed' do
    @peep = Peeps.read
    erb :"chitter/feed"
  end

  post '/chitter/feed' do
    @peep = Peeps.read(params[:sort_by])
    erb :"chitter/feed"
  end

  run! if app_file == $0
end
