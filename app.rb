require 'sinatra'
require_relative './lib/post'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    @posts = Post.all
    erb :index
  end

  post '/new_post' do
    Post.create(params[:message])
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
