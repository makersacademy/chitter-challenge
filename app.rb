require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Welcome to Chitter!'
  end

  post '/add_post' do
    @post = Posts.all
    erb :add_post
  end

  get '/view_post' do
    @post = params[:text]
    erb :view_post
  end

  run! if app_file == $0
end
