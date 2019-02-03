require 'pg'
require 'sinatra/base'
require './lib/post'

class Chitter < Sinatra::Base

  get '/' do
    "Welcome to Chitter"
  end

  get '/posts' do
    @post = Post.all

    erb(:"posts/index")
  end

  get '/posts/new' do
    erb(:"posts/new")
  end

  post '/posts' do
    Post.create(chit: params[:chit])
    redirect '/posts'
  end

  run! if app_file == $0

end
