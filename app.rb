require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Chitter'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(peep_text: params[:peep_text], user_id: params[:user_id])
    redirect '/peeps'
  end

  get '/peeps/:user_id' do
    @selected_peeps = Peep.select(user_id: params[:user_id])
    erb :'peeps/user_peeps'
  end

  run! if app_file == $0
end