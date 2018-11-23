require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @peeps = Peep.all
    erb(:index)
  end

  post '/peeps/new' do
    Peep.create(description: params[:peep]).first
    redirect '/'
  end

  get '/login' do 
    erb(:login)
  end

  get '/signup' do
    erb(:signup)
  end

end
