require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/chitter'

class ChitterApp < Sinatra::Base 
  enable :sessions
  register Sinatra::Flash

  get '/' do
    "Chitter App"
  end

  post '/chitter-post' do
    Chitter.chitter_post(peep: params[:peep], user_id: 1)
    redirect '/chitter'
  end

  get '/chitter' do
    @peeps = Chitter.chitter_all
    erb :'chitter/index'
  end

  run! if app_file == $0
end
