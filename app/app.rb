require 'sinatra/base'
require_relative 'models/post'

class Blabber < Sinatra::Base

  get '/posts' do
    @posts = Post.all
    erb(:'posts/index')
  end

  get '/posts/new' do
    erb(:'posts/new')
  end

  post '/posts' do
    Post.create(body: params[:body])
    redirect '/posts'
  end
end
