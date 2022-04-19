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

  get 'sign_up' do
    
  end

  run! if app_file == $0
end