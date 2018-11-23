require 'sinatra/base'
require './lib/peep'
require './lib/user'

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

  post '/signup' do
    redirect('/')
  end

end
