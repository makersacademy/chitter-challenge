require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peeps'


class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    
  end

  get '/' do
    
    'Chitter'
  end

  get '/peeps' do
    @peeps = Peeps.all   
    erb :'index'
  end

  get '/peeps/new' do
    erb :'new'
  end

  post '/peeps' do
    Peeps.create(name: params[:name])
    redirect '/peeps'
  end



  run! if app_file == $0
end