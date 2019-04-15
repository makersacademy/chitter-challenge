require 'sinatra/base'
require './lib/post'

class Chitter < Sinatra::Base

  get '/posts' do
    @posts = Post.all
    erb :'posts/index'
  end

  get '/posts/new' do
    erb :'posts/new'
  end

  post '/posts' do
    Post.create(post: params[:post])
    redirect '/posts'
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    User.create(email: params[:email], password: params[:password])
    redirect '/posts'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
