require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Welcome to Chitter!'
  end

  get '/add_post' do
    @post = params[:post]
    erb :add_post
    #redirect '/view_post'
  end

  get '/view_post' do
    erb :view_post
  end

  run! if app_file == $0
end
