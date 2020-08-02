require 'sinatra/base'
require './lib/peep.rb'

class Chitter < Sinatra::Base
  get '/' do
    'Hello World'
  end

  post '/wall' do
    Peep.add(username: params[:username], message: params[:peep])
    redirect('/wall')
  end

  get '/wall/new' do
    erb(:new)
  end

  get '/wall' do
    @peeps = Peep.all
    erb(:index)
  end

  get 'login' do
    erb(:login)
  end

  run! if app_file == $0

end
