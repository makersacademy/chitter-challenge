require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peeps'
require './lib/user'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Welcome to Chitter'
  end

  get '/chitter' do
    @peeps = Peeps.all
    erb :index
  end

  get '/chitter/new' do
    erb :new
  end

  post '/chitter' do
    name = params['name']
    peep = params['peep']
    tags = params['tags']

    Peeps.create(name: params[:name], peep: params[:peep], tags: params[:tags])
    redirect '/chitter'
  end

  enable :sessions, :method_override

  delete '/chitter/:id' do
    Peeps.delete(id: params[:id])
    redirect '/chitter'
  end

  get '/chitter/sign_up' do
    erb :sign_up
  end

  post '/chitter' do
    name = params['name']
    email = params['email']
    password = params['password']
    User.sign_up(name: name, email: email, password: password)
  end



  run! if app_file == $0
end
