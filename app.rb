require 'pg'
require 'sinatra/base'
require './lib/post'
require './lib/user'

class Chitter < Sinatra::Base

  get '/' do
    erb(:"posts/signup")
  end

  post '/' do
    User.create(username: params[:username], email: params[:email], password: params[:password])
    redirect '/posts'
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
