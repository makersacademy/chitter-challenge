require 'sinatra/base'
require_relative 'lib/posts'


class WebChitter < Sinatra::Base
  enable :sessions
  get '/' do
    @posts = params[:peep]
    erb :index
  end

  get '/posts' do
    @posts = Posts.show_posts
    erb :posts
  end

  post '/posts' do
    @posts = params[:peep]
    redirect '/'
  end
end
