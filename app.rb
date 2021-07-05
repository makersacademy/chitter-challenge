require 'sinatra/base'
require './lib/post'

class Chitter < Sinatra::Base
  get '/' do
    erb(:index)
  end

  post '/save' do
    Post.create(peep: params[:peep])
    redirect '/wall'
  end

  get '/wall' do
    @posts = Post.all.reverse
    erb(:wall)
  end
end