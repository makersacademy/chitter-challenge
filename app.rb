require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'
require './lib/peep.rb'

class Chitter < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @peeps = Peep.all
    erb :'/index'
  end

  post '/add_peep' do
    Peep.create(message: params['message'])
    redirect '/'
  end

  post 'sign_up' do
    User.create(name: params['name'], username: params['username'], email: params['email'], password: params['password'])
    redirect '/'
  end

  run! if app_file == $0
end