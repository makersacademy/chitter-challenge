require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/chitter' do
    @peeps = Peep.all
    erb(:'chitter/index')
  end

  post '/chitter' do
    Peep.add(params[:peep])
    redirect ('/chitter')
  end
    
  get '/chitter/compose' do
    erb(:'chitter/compose')
  end

  get '/chitter/join' do
    erb(:'chitter/join')
  end

  post '/chitter/join' do
    User.create(params[:Name], params[:Email], params[:username], params[:password])
    redirect ('/chitter/welcome')
  end

  get '/chitter/welcome' do
    @username = User.username
    erb(:'chitter/welcome')
  end

  run if app_file == $0
end
