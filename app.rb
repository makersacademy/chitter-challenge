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
    Peeps.save_peep(params[:message])
    redirect '/chitter/feed'
  end

  get '/chitter/feed' do
    @peep = Peeps.peep_show
    erb :"chitter/feed"
  end

  run! if app_file == $0
end
