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
    Chitter.peep_post(peep: params[:peep], user_id: 1)
    redirect '/chitter'
  end

  post '/chitter-delete/:id' do
    Chitter.peep_delete(id: params[:id])
    redirect '/chitter'
  end

  post '/chitter-sort' do
    session[:toggle] = params[:peep_sort]
    redirect '/chitter'
  end

  get '/chitter' do
    session[:toggle] != 'DESC' ? @peeps = Chitter.peep_all : @peeps = Chitter.peep_sort
    erb :'chitter/index'
  end

  run! if app_file == $0
end
