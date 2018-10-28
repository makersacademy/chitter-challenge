require 'sinatra/base'
require './lib/peep'

class ChitterManager < Sinatra::Base

  enable :sessions, :method_override

  get '/' do
    'Chitter'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'index'
  end

  get '/new' do
    @peeps = Peep.all
    erb :'signed_in'
  end

  post '/new' do
    Peep.create(message: params[:message], user_name: params[:user_name], timeofpeep: Time.now)
    redirect '/new'
  end

  delete '/:id' do
    Peep.delete(id: params[:id])
    redirect '/new'
  end

  run! if app_file == $0
end
