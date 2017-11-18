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

  get '/newpost' do
    erb(:newpost)
  end

  post '/home' do
  Post.create(post: params[:post], name: params[:name])
  redirect '/home'
end

end
