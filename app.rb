require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'
require './lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions
 
  get '/' do
    redirect '/home'
  end

  get '/home' do
    @peeps = Peep.all.reverse
    erb :home
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    Peeps.post(peep: params[:peep])
    redirect '/home'
  end

  run! if app_file == $0

end
