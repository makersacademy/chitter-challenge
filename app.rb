require 'sinatra'
require 'sinatra/reloader'
require './lib/peeps'

class PeepsManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Peeps'
  end

  get '/peeps' do
    @peeps = Peeps.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    p params
    p "form data submitted to the /bookmarks route"
  end
  run! if app_file == $0
end