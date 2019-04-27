require 'sinatra/base'
require_relative './lib/post'

class Chitter < Sinatra::Base

  get '/' do
    @posts = Post.all
    erb :index
  end

  post '/new_post' do
    Post.create(message: params[:message], created_at: Time.now)
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
