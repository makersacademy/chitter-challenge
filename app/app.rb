require 'sinatra/base'
require './app/models/post'

class App < Sinatra::Base
  get '/' do
    redirect '/home'
  end

  get '/home' do
    @post = Post.all
    erb(:home)
  end

end
