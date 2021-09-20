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
    erb :index
  end

  post '/send' do
    @peep = params['peep']
    Peep.send(content: params['peep'], time: Time.now, username: params['username'])
    erb :peep_sent
  end

  get '/feed' do
    @peeps = Peep.feed
    @peeps.reverse!
    erb :feed
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