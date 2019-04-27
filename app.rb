require 'sinatra/base'
require_relative './lib/chitter_model'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :front_page
  end

  get '/chitter' do
    erb :'chitter/index'
  end

  get '/chitter/new' do

    erb :'chitter/new'
  end

  get '/chitter/username' do
    @peeps = ChitterModel.all
    erb :'chitter/username'
  end

  post '/chitter/username' do
    ChitterModel.create(params[:peep])
    redirect '/chitter/username'
  end

  run! if __FILE__ == $0
end