require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  $peeps = []

  get '/' do
    @peeps = Peep.feed
    erb :index
  end

  post '/send' do
    Peep.send(content: params['peep'], time: Time.now, username: params['username'])
    redirect '/'
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    User.create(email: params['email'], username: params['username'], password: params['password'], name: params['name'])
    redirect '/'
  end

  run! if app_file == $0
end